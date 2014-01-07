% if mode == 'definition':
balanced.Debit.find
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

debit = balanced.Debit.find('/debits/WD6TAVProqNixngz5tRCO52C')
% endif