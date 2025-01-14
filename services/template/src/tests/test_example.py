import pytest
from ..lib import example as lib_example
from httpx import AsyncClient

@pytest.mark.anyio()
async def test_example_lib_func(
    test_client : "AsyncClient"
):
    """An example of testing a library function"""

    sum_ = await lib_example.example_func(5, 10)
    
    # Ensure that 10 + 5 == 15 i guess idk
    assert sum_ == 15

@pytest.mark.anyio()
async def test_example_ping(
    test_client : "AsyncClient"
):
    """An example of testing an HTTP request"""

    resp = await test_client.get("/example/ping")

    # Basically just ensure that something happened and you got a response
    assert resp.status_code == 200
