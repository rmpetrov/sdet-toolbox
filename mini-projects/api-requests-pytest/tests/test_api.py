import requests


BASE_URL = "https://jsonplaceholder.typicode.com"


def test_get_post_by_id():
    response = requests.get(f"{BASE_URL}/posts/1", timeout=10)
    assert response.status_code == 200
    payload = response.json()
    assert payload["id"] == 1
    assert "title" in payload
    assert "body" in payload
