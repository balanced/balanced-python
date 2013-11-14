% if mode == 'definition':
balanced.Refund.find
% else:
import balanced

balanced.configure('ak-test-14W5azoiV99O1XiPwZ3faH10MaUdZ1kCA')

refund = balanced.Refund.find('/v1/customers/CU35rlJBXqlvD9LC26PWu0cy/refunds/RF3fVPCag0ppfvvWLSc2oQ4O')
% endif