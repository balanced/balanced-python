import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

debit = balanced.Debit.find('/debits/WD7yQnigdgrO2Bkc7vLIdkeW')
refund = debit.refund()