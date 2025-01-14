from httpx import AsyncClient, ASGITransport
from ..app import app
import pytest

@pytest.fixture(scope="session")
def anyio_backend():
    return "asyncio"


@pytest.fixture(scope="session")
async def test_client():
    async with AsyncClient(
        transport=ASGITransport(app=app), base_url="https://test"
    ) as ac:
        yield ac