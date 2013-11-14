import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

customer = balanced.Customer.find('/v1/customers/CU3yqhHviPZ4ZbpHMcaa3SKH')
customer.add_card('/v1/marketplaces/TEST-MP52IlCmywk6hGbgS75QSlN/cards/CC3AiMy0KEP1PhwnffMk32RF')