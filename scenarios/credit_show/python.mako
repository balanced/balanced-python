% if mode == 'definition':
balanced.Credit().find()
% else:
import balanced

balanced.configure('ak-test-2IuKttETJEorSZLxA9tVbWBIWnRa1kC9P')

credit = balanced.Credit.find('/credits/CR3DLTIjMve5idvjBrXNKBHE')
% endif