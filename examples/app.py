#!/usr/bin/env python
from __future__ import unicode_literals
import optparse

from flask import Flask


app = Flask(__name__, static_folder='./fe/static')


@app.route('/')
def index():
    return render_template('example.html')


if __name__ == '__main__':
    parser = optparse.OptionParser()
    parser.add_option('--port', '-p', default=3000, type=int)
    parser.add_option('--host', '-s', default='127.0.0.1')
    options, _args = parser.parse_args()
    app.run(debug=True, host=options.host, port=options.port)
