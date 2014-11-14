import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

card = balanced.Card.fetch('/cards/CC3IBNr3erYpVuuZDyWNFfet')
card.associate_to_customer('/customers/CU40AyvBB6ny9u3oelCwyc3C')