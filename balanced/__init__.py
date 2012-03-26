__version__ = '0.1'

import contextlib


from balanced.http_client import HTTPClient
from balanced.resources import (
    Resource, Marketplace, Account, APIKey,
    Authorization, Credit, Debit, Refund,
    Merchant)


__all__ = [
    Resource.__name__,
    Marketplace.__name__,
    Account.__name__,
    APIKey.__name__,
    Authorization.__name__,
    Credit.__name__,
    Debit.__name__,
    Refund.__name__,
    Merchant.__name__,
    ]

http_client = HTTPClient()
config = http_client.config


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
