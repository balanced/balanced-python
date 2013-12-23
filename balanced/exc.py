from __future__ import unicode_literals

import wac


class BalancedError(Exception):
    pass


class ResourceError(BalancedError):
    pass


class NoResultFound(BalancedError):
    pass


class MultipleResultsFound(BalancedError):
    pass


class HTTPError(BalancedError, wac.Error):

    class __metaclass__(type):

        def __new__(meta_cls, name, bases, dikt):
            cls = type.__new__(meta_cls, name, bases, dikt)
            cls.types = [
                getattr(cls, k)
                for k in dir(cls)
                if k.isupper() and isinstance(getattr(cls, k), basestring)
            ]
            cls.type_to_error.update(zip(cls.types, [cls] * len(cls.types)))
            return cls

    @classmethod
    def from_response(cls, r):
        if not hasattr(r, 'data') or 'type' not in r.data:
            exc = wac.Error
        else:
            exc = cls.type_to_error.get(r.data['type'], HTTPError)
        return exc(r)

    type_to_error = {}


class FundingInstrumentVerificationFailure(HTTPError):
    pass


class BankAccountVerificationFailure(FundingInstrumentVerificationFailure):
    AUTH_NOT_PENDING = 'bank-account-authentication-not-pending'
    AUTH_FAILED = 'bank-account-authentication-failed'
    AUTH_DUPLICATED = 'bank-account-authentication-already-exists'
