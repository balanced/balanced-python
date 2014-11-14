import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

customer = balanced.Customer(
    dob_year=1963,
    dob_month=7,
    name='Henry Ford',
    address={
        'postal_code': '48120'
    }
).save()