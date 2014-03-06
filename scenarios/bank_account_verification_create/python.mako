% if mode == 'definition':
balanced.BankAccountVerification().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA50LpPrCTB63Ecm0wEgdOQM')
verification = bank_account.verify()
% endif