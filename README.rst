Balanced
--------

Payments platform for online marketplaces


Authentication
``````````````

::

    import balanced
    key = balanced.APIKey().save()
    balanced.configure(key.secret)


Create a marketplace
````````````````````
You have to create a marketplace before creating accounts to
debit and credit.

::

    Marketplace().save()


Create a buyer
``````````````

::

    from balanced import Account

    buyer = Account(
        name='Bill James',  # Optional
        email_address='will@gmail.com',
        card={
            'name': 'William James',  # Optional
            'card_number': '4111111111111111',
            'expiration_month': 4,
            'expiration_year': 2014,
            'security_code': '807',  # Optional
            'street_address': '167 West 74th Street',  # Optional
            'postal_code': '10023',  # Optional
            'country_code': 'USA',  # Default
            'phone_number': '+16505551234'  # Optional
        }
    ).save()


Debit a buyer
`````````````

::

    debit = buyer.debit(
        20000,
        appears_on_statement_as='example.com'  # Default: marketplace domain
        description='Beat by Dr. Dre'  # Optional
    )


Refund a debit
``````````````

::

    debit.refund()



Create a merchant (individual person)
`````````````````````````````````````

::

    from balanced import Account

    merchant = Account(
        name='Bill James',  # Optional
        email_address='bill@gmail.com',
        merchant={
            'type': 'person',
            'name': 'William James',
            'tax_id': '393483992',  # SSN in the US
            'street_address': '167 West 74th Street',  # Home address
            'postal_code': '10023',
            'dob': '1842-01',  # YYYY-MM
            'phone_number': '+16505551234',
        },
        bank_account={  # Optional
            'name': 'William James',
            'account_number': '28304871049',
            'bank_code': '121042882'  # Routing number in the US
        }
    ).save()


Create a merchant (Business)
`````````````````````````````

::

    from balanced import Account

    merchant = Account(
        name='Levain Bakery',  # Optional
        email_address='levain@gmail.com',
        merchant={
            'type': 'business',
            'name': 'Levain Bakery',
            'tax_id': '253912384',  # EIN in the US
            'street_address': '167 West 74th Street',  # Optional
            'postal_code': '10023',  # Optional
            'phone_number': '+16505551234',
            'person': {
                'name': 'William James',
                'tax_id': '393483992',  # SSN in the US
                'street_address': '167 West 74th Street',  // Home address
                'postal_code': '10023',
                'dob': '1842-01',  # YYYY-MM
                'phone_number': '+16505551234',
            }
        }
        bank_account={  # Optional
            'name': 'Levain Bakery LLC',
            'account_number': '28304871049',
            'bank_code': '121042882'  # Routing number in the US
        }
    )


Credit a merchant
`````````````````

::

    merchant.credit(19000, description='Beats by Dr. Dre')


Known API Issues
````````````````
- Credit card and bank account information do not show up on transactions or accounts
- Need to define ways to generate rejections -- card declined, merchant declined, etc. --
cases in test environment
- There is no date defined for when an authorization was voided
- Need better documentation
