% if mode == 'definition':
balanced.BankAccount().credits
% elif mode == 'request':
import balanced

balanced.configure('ak-test-1kvvievk0Qqw5wQPsrlM9g7wQwNe62cyc')

bank_account = balanced.BankAccount.fetch('/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy/credits')
credits = bank_account.credits
% elif mode == 'response':
{
    "links": {}, 
    "meta": {
        "first": "/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy/credits?limit=10&offset=0", 
        "href": "/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy/credits?limit=10&offset=0", 
        "last": "/bank_accounts/BA1QFf0LmIxr8p41msqX46Oy/credits?limit=10&offset=0", 
        "limit": 10, 
        "next": null, 
        "offset": 0, 
        "previous": null, 
        "total": 0
    }
}
% endif