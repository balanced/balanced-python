% if mode == 'definition':
balanced.Refund.find()
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

refund = balanced.Refund.find('/refunds/RF7AxY5iLVIl7a3QtcoVZocS')
% endif