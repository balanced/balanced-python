% if mode == 'definition':
balanced.Refund().save()
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

refund = balanced.Refund.fetch('/refunds/RF3RklPuFgsgI50UuYtr4g6I')
refund.description = 'update this description'
refund.meta = {
  'user.refund.count': '3',
  'refund.reason': 'user not happy with product',
  'user.notes': 'very polite on the phone',
}
refund.save()
% elif mode == 'response':
{
    "links": {
        "refunds.debit": "/debits/{refunds.debit}", 
        "refunds.dispute": "/disputes/{refunds.dispute}", 
        "refunds.events": "/refunds/{refunds.id}/events", 
        "refunds.order": "/orders/{refunds.order}"
    }, 
    "refunds": [
        {
            "amount": 3000, 
            "created_at": "2014-01-27T22:58:11.375665Z", 
            "currency": "USD", 
            "description": "update this description", 
            "href": "/refunds/RF3RklPuFgsgI50UuYtr4g6I", 
            "id": "RF3RklPuFgsgI50UuYtr4g6I", 
            "links": {
                "debit": "WD3MKNxNTKBGgA7mX50yogiu", 
                "dispute": null, 
                "order": null
            }, 
            "meta": {
                "refund.reason": "user not happy with product", 
                "user.notes": "very polite on the phone", 
                "user.refund.count": "3"
            }, 
            "status": "succeeded", 
            "transaction_number": "RF383-088-7077", 
            "updated_at": "2014-01-27T22:58:17.950799Z"
        }
    ]
}
% endif