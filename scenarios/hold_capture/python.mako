% if mode == 'definition':

balanced.Hold.capture(...)
% else:
import balanced

balanced.configure("46c08048cd8811e2acae026ba7c1aba6")


hold = balanced.Hold.find('/v1/marketplaces/TEST-MP29J5STPtZVvnjAFndM0N62/holds/HL3eEBWviWudXZlBXN7FLrTA')
debit = hold.capture(
    appears_on_statement_as='ShowsUpOnStmt',
    description='Some descriptive text for the debit in the dashboard',
)

% endif