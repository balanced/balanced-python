import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

card = balanced.Card.fetch('/cards/CC526JELNk4pET43bVu6rGkZ')
card.associate_to_customer('/customers/CU36bqPshRNopkLNM6qBmn5e')