% if mode == 'definition':
balanced.APIKey()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

bank_account = balanced.APIKey().save()
% endif