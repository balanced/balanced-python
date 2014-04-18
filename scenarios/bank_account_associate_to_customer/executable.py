import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card = balanced.Card.fetch('/bank_accounts/BAscOV2erMwv3yhIb5sFTaV')
card.associate_to_customer('/customers/CUeXNjpejPooRtSnJLc6SRD')