from fastapi.routing import APIRouter
from fastapi.responses import JSONResponse

router = APIRouter(
    prefix="/example"
)

@router.get("/ping")
async def example_ping() -> JSONResponse:
    return JSONResponse({
        "pong" : True
    })

@router.get("/ping2")
async def example_ping2() -> JSONResponse:
    return JSONResponse({
        "pong 2" : True
    })

__all__ = [
    router
]