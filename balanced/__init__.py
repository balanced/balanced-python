__version__ = '0.11.14'
from collections import defaultdict
import contextlib

from balanced._http_client import HTTPClient
from balanced.resources import (
    Resource, Marketplace, Account, APIKey,
    Hold, Credit, Debit, Refund,
    Merchant, Transaction, BankAccount, Card,
    Callback, Event, EventCallback, EventCallbackLog,
    BankAccountVerification, Customer,
)
from balanced import exc


__all__ = [
    Resource.__name__,
    Marketplace.__name__,
    Account.__name__,
    APIKey.__name__,
    Hold.__name__,
    Credit.__name__,
    Debit.__name__,
    Refund.__name__,
    Merchant.__name__,
    Transaction.__name__,
    Card.__name__,
    BankAccount.__name__,
    Callback.__name__,
    Event.__name__,
    EventCallback.__name__,
    EventCallbackLog.__name__,
    BankAccountVerification.__name__,
    Customer.__name__,
    exc.__name__.partition('.')[-1],
]

# See https://github.com/balanced/balanced-python/issues/44 re: naming.
http_client = HTTPClient()
config = http_client.config


CACHE = defaultdict(dict)


def bust_cache():
    CACHE.clear()


def configure(api_key_secret):
    config.api_key_secret = api_key_secret


def is_configured():
    return bool(config.api_key_secret)


Resource.http_client = http_client


@contextlib.contextmanager
def key_switcher(the_new_api_key_secret):
    old_api_key = config.api_key_secret
    config.api_key_secret = the_new_api_key_secret
    try:
        yield
    finally:
        config.api_key_secret = old_api_key
