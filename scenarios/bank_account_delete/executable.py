import balanced

balanced.configure('b5de51921b2d11e389c4026ba7cac9da')


bank_account = balanced.BankAccount.find('/v1/bank_accounts/BA5YXVcU9ExcM8jXQhQt7ZY6')
bank_account.delete()