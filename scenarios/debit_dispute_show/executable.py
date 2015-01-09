import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

debit = balanced.Debit.fetch('/debits/WD5SwXr9jcCfCmmjTH5MCMFD')
dispute = debit.dispute