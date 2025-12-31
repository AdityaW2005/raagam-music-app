import uuid
import bcrypt
from fastapi import HTTPException
from fastapi import APIRouter
from server.models.user import User
from server.pydantic_schemas.user_create import UserCreate
from database import db

router = APIRouter()

@router.post('/signup')

def signup_user(user: UserCreate):
    # Extract the data that is coming from Request
    """
    print(user.name)
    print(user.email)
    print(user.password)
    """
    
    # Check if the user already exists in db
    user_db = db.query(User).filter(User.email == user.email).first()
    if user_db:
        raise HTTPException(400, "User with the same email already exists!")
    hashed_pwd = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())
    user_db = User(id = str(uuid.uuid4()), name = user.name, email = user.email, password = hashed_pwd)

    # Else add the user to the db
    db.add(user_db)
    db.commit()
    db.refresh(user_db)

    return user_db