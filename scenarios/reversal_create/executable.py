import balanced

balanced.configure('ak-test-1tUen2a604QT05iGc6p4pbPjTqsAPMFCl')

credit = balanced.Credit.find('/credits/CR7HIdtAm4eFX1weOgiaRGQM')
reversal = credit.reverse()