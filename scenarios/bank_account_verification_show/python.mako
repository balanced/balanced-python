% if mode == 'definition':

balanced.Verification.find
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")



bank_account = balanced.BankAccount.find("/v1/bank_accounts/BA2mettVyrsL0krXEXeS1kes")
verification = bank_account.verification

% endif