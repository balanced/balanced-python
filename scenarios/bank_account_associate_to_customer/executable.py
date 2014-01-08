import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

card = balanced.Card.find('/bank_accounts/BA3VFGbCg9X5lAzg2FdMhr5w')
card.associate_to('/customers/CU3QDD1R3iMoGbwiCnoHfd6W')