import unittest


class TestBalancedImportStar(unittest.TestCase):

    def test_import_star(self):
        # not sure who uses import * any more, but we should
        # test this
        try:
            # the __import__ doesn't do what I want here.
            # and doing a "from balanced import *" generates an
            # unsupressable SyntaxWarning.
            exec("from balanced import *")  # pylint: disable-msg=W0122
        except Exception as exc:
            raise ImportError("%s" % exc)
