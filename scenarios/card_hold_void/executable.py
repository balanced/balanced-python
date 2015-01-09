import balanced

balanced.configure('ak-test-2eKlj1ZDfAcZSARMf3NMhBHywDej0avSY')

card_hold = balanced.CardHold.fetch('/card_holds/HL4u4T2877PfgYwnbhD2XweV')
card_hold.cancel()