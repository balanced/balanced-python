import balanced

balanced.configure('ak-test-2wIOi20ITgc1u1Lw6UM3y5ZZjZ66M8HMf')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()