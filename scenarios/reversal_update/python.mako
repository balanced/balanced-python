% if mode == 'definition':
balanced.Reversal().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

reversal = balanced.Reversal.fetch('/reversals/RV42n8M9XZWna427oPDDi4RG')
reversal.description = 'update this description'
reversal.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
reversal.save()
% elif mode == 'response':
{
    "links": {
        "reversals.credit": "/credits/{reversals.credit}", 
        "reversals.events": "/reversals/{reversals.id}/events", 
        "reversals.order": "/orders/{reversals.order}"
    }, 
    "reversals": [
        {
            "amount": 3000, 
            "created_at": "2014-01-27T22:58:21.214829Z", 
            "currency": "USD", 
            "description": "update this description", 
            "failure_reason": null, 
            "failure_reason_code": null, 
            "href": "/reversals/RV42n8M9XZWna427oPDDi4RG", 
            "id": "RV42n8M9XZWna427oPDDi4RG", 
            "links": {
                "credit": "CR40neytmVG2HDBp1opfF7sY", 
                "order": null
            }, 
            "meta": {
                "refund.reason": "user not happy with product", 
                "user.notes": "very polite on the phone", 
                "user.satisfaction": "6"
            }, 
            "status": "succeeded", 
            "transaction_number": "RV219-169-0008", 
            "updated_at": "2014-01-27T22:58:27.354488Z"
        }
    ]
}
% endif