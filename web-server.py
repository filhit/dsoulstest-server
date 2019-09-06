from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime
import json
import ssl

last_update = None
last_players = None

class HTTPRequestHandler(BaseHTTPRequestHandler):

    def end_headers (self):
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Content-Type', 'application/json')
        BaseHTTPRequestHandler.end_headers(self)

    def create_response(self):
        response = {}

        if last_update is None:
            response['status'] = 'Error'
        else:
            response['last_update'] = last_update.isoformat()

        if last_players is not None:
            response['players'] = last_players

        return response

    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(json.dumps(self.create_response()).encode())

    def do_POST(self):
        content_length = int(self.headers['Content-Length'])
        body = self.rfile.read(content_length)
        request = json.loads(body.decode())
        global last_players
        last_players = request['players']
        self.send_response(200)
        self.end_headers()
        self.wfile.write('{}'.encode())
        global last_update
        last_update = datetime.now()

httpd = HTTPServer(('', 30001), HTTPRequestHandler)
httpd.socket = ssl.wrap_socket (httpd.socket,
        keyfile="/etc/letsencrypt/live/minetest.westeurope.cloudapp.azure.com/privkey.pem",
        certfile='/etc/letsencrypt/live/minetest.westeurope.cloudapp.azure.com/fullchain.pem',
        server_side=True)

httpd.serve_forever()
