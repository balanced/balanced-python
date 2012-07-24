import requests


class BalancedError(Exception):
    pass


class ResourceError(BalancedError):
    pass


class NoResultFound(BalancedError):
    pass


class MultipleResultsFound(BalancedError):
    pass


class HTTPError(BalancedError, requests.HTTPError):
    """
    Baseclass for all HTTP exceptions.
    """
    status_code = None


class MoreInformationRequiredError(HTTPError):
    redirect_uri = None
