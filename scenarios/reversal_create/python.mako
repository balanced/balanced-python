% if mode == 'definition':
balanced.Credit().reverse()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

credit = balanced.Credit.find('/credits/CR4lqO3NwBWdLYGvMAUeKt7g')
reversal = credit.reverse()
% endif