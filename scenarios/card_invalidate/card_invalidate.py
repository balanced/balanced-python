import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


card = balanced.Card.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/cards/CC2thwNijAS2qdwoWtqanNh6')
card.is_valid = False
card.save()