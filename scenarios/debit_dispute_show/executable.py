import balanced

balanced.configure('ak-test-25ZY8HQwZPuQtDecrxb671LilUya5t5G0')

debit = balanced.Debit.fetch('/debits/WD4xfFIxpeQpeRHm55Qc2xV3')
dispute = debit.dispute