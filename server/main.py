from fastapi import FastAPI
from server.routes import auth
from server.models.base import Base
from server.database import engine

app = FastAPI()

app.include_router(auth.router, prefix = '/auth')

Base.metadata.create_all(engine)
