import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

card = balanced.Card.find('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/cards/CC1i5vMNFo69BmOfBWcx5iZM')
card.unstore()