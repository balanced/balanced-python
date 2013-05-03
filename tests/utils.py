import contextlib
import multiprocessing
import unittest

from wsgiref.simple_server import make_server


class WSGIServerTest(unittest.TestCase):

    def setUp(self):
        self.server_process = None

    @contextlib.contextmanager
    def start_server(self, app, port=31337):
        server = make_server('', port, app)
        self.server_process = multiprocessing.Process(
            target=server.serve_forever
        )
        try:
            self.server_process.start()
            yield
        finally:
            self._stop_server()

    def _stop_server(self):
        self.server_process.terminate()
        self.server_process.join()
        del self.server_process
        self.server_process = None
