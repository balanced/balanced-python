% if mode == 'definition':
balanced.Card().hold()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card = balanced.Card.fetch('/cards/CC2abDOQVm5aNFhHpcRvWS02')
card_hold = card.hold(
  amount=5000,
  description='Some descriptive text for the debit in the dashboard'
)
% elif mode == 'response':
{
    "card_holds": [
        {
            "amount": 5000, 
            "created_at": "2014-01-27T22:56:49.446376Z", 
            "currency": "USD", 
            "description": "Some descriptive text for the debit in the dashboard", 
            "expires_at": "2014-02-03T22:56:50.793698Z", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/card_holds/HL2ncCO5Bir2S0PCdsDHV3cG", 
            "id": "HL2ncCO5Bir2S0PCdsDHV3cG", 
            "links": {
                "card": "CC2abDOQVm5aNFhHpcRvWS02", 
                "debit": null
            }, 
            "meta": {}, 
            "transaction_number": "HL102-313-8003", 
            "updated_at": "2014-01-27T22:56:51.115729Z"
        }
    ], 
    "links": {
        "card_holds.card": "/resources/{card_holds.card}", 
        "card_holds.debit": "/debits/{card_holds.debit}", 
        "card_holds.debits": "/card_holds/{card_holds.id}/debits", 
        "card_holds.events": "/card_holds/{card_holds.id}/events"
    }
}
% endif