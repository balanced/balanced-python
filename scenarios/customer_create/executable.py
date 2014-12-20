import balanced

balanced.configure('ak-test-1xLFE6RLC1W3P4ePiQDI4UVpRwtKcdfqL')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()