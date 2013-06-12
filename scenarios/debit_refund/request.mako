${main.python_boilerplate()}
debit = balanced.Debit.find('${request['debit_uri']}')
debit.refund()