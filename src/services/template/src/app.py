from fastapi import FastAPI
from .routers import (
    example_router
)

app = FastAPI()

app.include_router(example_router)