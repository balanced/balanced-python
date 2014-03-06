% if mode == 'definition':
balanced.Card().associate_to_customer()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2cSDy37BKy5K4NUHKHVNXNTjTHPEqjRtB')

card = balanced.Card.fetch('/bank_accounts/BA4JCiiAb4alhWMlZSv9POAU')
card.associate_to_customer('/customers/CU4EeI9UPzRcOo2C3j1qFjQj')
% endif