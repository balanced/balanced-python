import balanced

balanced.configure('ak-test-22IOkhevjZlmRP2do6CZixkkDshTiOjTV')

debit = balanced.Debit.fetch('/debits/WD4YCKAyFrQBFYuFCUCRynOx')
dispute = debit.dispute