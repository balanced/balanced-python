% if mode == 'definition':
balanced.CardHold().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

card_hold = balanced.CardHold.fetch('/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S')
card_hold.description = 'update this description'
card_hold.meta = {
  'holding.for': 'user1',
  'meaningful.key': 'some.value',
}
card_hold.save()
% elif mode == 'response':
{
    "card_holds": [
        {
            "amount": 5000, 
            "created_at": "2014-01-27T22:56:39.379941Z", 
            "currency": "USD", 
            "description": "update this description", 
            "expires_at": "2014-02-03T22:56:39.876902Z", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/card_holds/HL2bT9uMRkTZkfSPmA2pBD9S", 
            "id": "HL2bT9uMRkTZkfSPmA2pBD9S", 
            "links": {
                "card": "CC2abDOQVm5aNFhHpcRvWS02", 
                "debit": null
            }, 
            "meta": {
                "holding.for": "user1", 
                "meaningful.key": "some.value"
            }, 
            "transaction_number": "HL500-842-5492", 
            "updated_at": "2014-01-27T22:56:44.255042Z"
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