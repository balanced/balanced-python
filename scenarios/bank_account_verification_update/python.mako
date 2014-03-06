% if mode == 'definition':
balanced.BankAccountVerification().confirm()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-2ADpvITfpgBn8uBzEGsQ2bIgWaftUWiul')

verification = balanced.BankAccountVerification.fetch('/verifications/BZ5alC0fajkuBOvOU7lVT7QJ')
verification.confirm(amount_1=1, amount_2=1)
% endif