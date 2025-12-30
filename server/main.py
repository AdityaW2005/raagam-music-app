from fastapi import FastAPI
from pydantic import BaseModel
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

app = FastAPI()
DATABASE_URL = 'postgresql://postgres:musicapp123@localhost:5433/fluttermusicapp'
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit = False, autoflush = False, bind = engine)
db = SessionLocal()

class UserCreate(BaseModel):
    name: str
    email: str
    password: str

@app.post('/signup')

def signup_user(user: UserCreate):
    # Extract the data that is coming from Request
    print(user.name)
    print(user.email)
    print(user.password)
    
    # Check if the user already exists in db
    # Else add the user to the db
    pass
