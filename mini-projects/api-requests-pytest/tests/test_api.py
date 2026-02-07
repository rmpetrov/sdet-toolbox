import json
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from threading import Thread

import pytest
import requests


class _ApiHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/health":
            self._send_json(200, {"status": "ok"})
            return
        if self.path == "/posts/1":
            self._send_json(200, {"id": 1, "title": "local-post", "body": "local-body"})
            return
        self._send_json(404, {"error": "not_found"})

    def _send_json(self, status_code, payload):
        body = json.dumps(payload).encode("utf-8")
        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def log_message(self, format_string, *args):
        return


@pytest.fixture(scope="module")
def api_base_url():
    server = ThreadingHTTPServer(("127.0.0.1", 0), _ApiHandler)
    thread = Thread(target=server.serve_forever, daemon=True)
    thread.start()
    host, port = server.server_address
    yield f"http://{host}:{port}"
    server.shutdown()
    server.server_close()
    thread.join(timeout=2)


def test_health_endpoint(api_base_url):
    response = requests.get(f"{api_base_url}/health", timeout=5)
    assert response.status_code == 200
    assert response.json() == {"status": "ok"}


def test_get_post_by_id(api_base_url):
    response = requests.get(f"{api_base_url}/posts/1", timeout=5)
    assert response.status_code == 200
    payload = response.json()
    assert payload["id"] == 1
    assert "title" in payload
    assert "body" in payload


def test_not_found_payload_shape(api_base_url):
    response = requests.get(f"{api_base_url}/posts/999", timeout=5)
    assert response.status_code == 404
    assert response.json() == {"error": "not_found"}
