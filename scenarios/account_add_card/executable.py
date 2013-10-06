import balanced

balanced.configure('ak-test-1p1Tsac7gHeMQowL2seB7ieliuAJAufyq')

account = balanced.Account.find('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/accounts/CU5U8N8xXdkTgLmmV3wSozLc')
account.add_card('/v1/marketplaces/TEST-MP5FKPQwyjvVgTDt7EiRw3Kq/cards/CC5WUKAGJIemxz0Bd7AJ8Lxu')