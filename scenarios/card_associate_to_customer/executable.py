import balanced

balanced.configure('ak-test-1ByQgRpcQLTwmOhCBUofyIHm0r96qPm8s')

card = balanced.Card.fetch('/cards/CCVkCgaysaNhZH3ITVLmQ9X')
card.associate_to_customer('/customers/CUeXNjpejPooRtSnJLc6SRD')