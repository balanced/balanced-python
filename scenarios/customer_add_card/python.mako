% if mode == 'definition':
balanced.Customer.add_card
% else:
import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

customer = balanced.Customer.find('/customers/CU73cQkqN6IUi8D4qBEsOPK')
customer.add_card('/cards/CC6MQlq1xIGRLEMBWQcD4Dcr')
% endif