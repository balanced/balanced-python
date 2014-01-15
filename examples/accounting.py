#!/usr/bin/env python
'''
Generate a csv report of month end transaction balances

python examples/accounting.py --api_key [Marketplace API Key] > Report.csv
python examples/accounting.py --api_key [Marketplace API Key] --use_cache > gnuplot ...

'''

import argparse
import calendar
import csv
from itertools import groupby
import os
import pickle
import sys

import balanced


def generate_report(args):
    balanced.configure(args.api_key)
    marketplace = balanced.Marketplace.mine

    if args.use_cache:
        credits = pickle.load(open('cache/credits.obj'))
        debits = pickle.load(open('cache/debits.obj'))
        refunds = pickle.load(open('cache/refunds.obj'))

    else:
        if not os.path.exists('./cache'):
            os.makedirs('./cache')

        print 'Downloading Debits'
        debits = balanced.Debit.query.all()

        print 'Downloading Credits'
        credits = balanced.Credit.query.all()

        print 'Downloading Refunds'
        refunds = balanced.Refund.query.all()

        print 'Caching Transactions'
        with open('cache/debits.obj', 'w') as f:
            pickle.dump(debits, f)

        with open('cache/credits.obj', 'w') as f:
            pickle.dump(credits, f)

        with open('cache/refunds.obj', 'w') as f:
            pickle.dump(refunds, f)

    txns = sorted(credits + debits + refunds, key=lambda x: x.created_at)

    def group(xs, head, tail):
        return {key: [tail(x) for x in group]
                for key, group in
                groupby(sorted(xs, key=head),
                        head)}

    # (year, month, txn)
    txns_by_period = [(t.created_at.year,
                       t.created_at.month,
                       t) for t in txns]

    # {year: [(month, txn)]}
    txns_by_year = group(txns_by_period,
                         lambda (y, m, txn): y,
                         lambda (y, m, txn): (m, txn))

    group_by_month = lambda xs: group(xs, lambda (a, b): a, lambda (a, b): b)

    # {year: {month: [txn]}}
    txns_by_year_by_month = {key: group_by_month(txns_by_year[key])
                             for key in txns_by_year}

    headers = ['Year', 'Month', 'Debits', 'Refunds', 'Credits',
               'Credits Pending', 'Escrow Balance']
    writer = csv.DictWriter(sys.stdout, headers)
    writer.writeheader()
    rolling_balance = 0

    for year in sorted(txns_by_year_by_month):
        for month in sorted(txns_by_year_by_month[year]):
            txns = txns_by_year_by_month[year][month]
            monthly_credits = [txn for txn in txns
                               if type(txn) == balanced.resources.Credit]
            monthly_debits = [txn for txn in txns
                              if type(txn) == balanced.resources.Debit]
            monthly_refunds = [txn for txn in txns
                               if type(txn) == balanced.resources.Refund]

            credit_amount = sum([c.amount for c in monthly_credits
                                 if c.status == 'paid'])
            debit_amount = sum([d.amount for d in monthly_debits
                                if d.status == 'succeeded'])
            refund_amount = sum([r.amount for r in monthly_refunds])
            credits_pending_amount = sum([c.amount for c in monthly_credits
                                          if c.status == 'pending'])

            rolling_balance += debit_amount
            rolling_balance -= (refund_amount + credit_amount)

            row = {}
            row['Year'] = str(year)
            row['Month'] = calendar.month_name[month]
            row['Debits'] = debit_amount / 100.0
            row['Refunds'] = refund_amount / 100.0
            row['Credits'] = credit_amount / 100.0
            row['Credits Pending'] = credits_pending_amount / 100.0
            row['Escrow Balance'] = (rolling_balance -
                                     credits_pending_amount) / 100.0
            writer.writerow(row)

def main():
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument('--api_key', action='store', dest='api_key',
                            required=True)
    arg_parser.add_argument('--use_cache', action='store_true')
    args = arg_parser.parse_args()
    generate_report(args)


if __name__ == '__main__':
    main()
