import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA4UZsYXpf2BX97v5WPaT57O')
bank_account.associate_to_customer('/customers/CU42QGL6X08UHbQnRqgCNtKg')