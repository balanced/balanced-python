% if mode == 'definition':
balanced.Customer().unstore()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

customer = balanced.Customer.fetch('/customers/CU3eeasZ9yQ86uzzIYZkrPGg')
customer.unstore()
% elif mode == 'response':

% endif