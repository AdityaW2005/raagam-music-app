from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

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
