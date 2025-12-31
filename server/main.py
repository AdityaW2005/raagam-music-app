from fastapi import FastAPI
from routes import auth
from server.models.base import Base
from database import engine

app = FastAPI()

app.include_router(auth.router, prefix = '/auth')

Base.metadata.create_all(engine)
