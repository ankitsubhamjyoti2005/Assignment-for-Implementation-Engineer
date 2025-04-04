import pytest
from app import create_app

@pytest.fixture
def client():
    app = create_app()
    return app.test_client()

def test_health_check(client):
    response = client.get("/health")
    assert response.status_code == 200
    assert response.json["status"] == "ok"
