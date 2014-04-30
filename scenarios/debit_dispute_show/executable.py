import balanced

balanced.configure('ak-test-aUV295IugdhWSNx2JFckYBCSvfY2ibgq')

debit = balanced.Debit.fetch('/debits/WDJ66VlXnDyDx5AS5uplxyt')
dispute = debit.dispute