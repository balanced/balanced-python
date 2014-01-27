% if mode == 'definition':
balanced.Debit.fetch()

% elif mode == 'request':
import balanced

balanced.configure('ak-test-nngzAf2ARJV0AA4zzxdyVYJWRa0WLa5I')

debit = balanced.Debit.fetch('/debits/WD3zpxOf9kLoeFmf6dYPfrYW')
% endif