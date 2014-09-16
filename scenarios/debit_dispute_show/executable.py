import balanced

balanced.configure('ak-test-1o9QKwUCrwstHWO5sGxICtIJdQXFTjnrV')

debit = balanced.Debit.fetch('/debits/WD6LJx0cm12NrjiXBR1okKt7')
dispute = debit.dispute