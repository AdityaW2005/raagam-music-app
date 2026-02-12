import uuid
import bcrypt
import jwt
from fastapi import Depends, HTTPException, Header
from fastapi import APIRouter
from server.middleware.auth_middleware import auth_middleware
from server.models.user import User
from server.pydantic_schemas.user_create import UserCreate
from server.database import get_db
from sqlalchemy.orm import Session
from server.pydantic_schemas.user_login import UserLogin
from typing import Optional

router = APIRouter()

@router.post('/signup', status_code = 201)

def signup_user(user: UserCreate, db: Session = Depends(get_db)):
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

@router.post('/login')
def login_user(user: UserLogin, db: Session = Depends(get_db)):
    # Check if a user with the same email already exists
    user_db = db.query(User).filter(User.email == user.email).first()
    if not user_db:
        raise HTTPException(400, "User not found!")
    
    # Password matching or not
    is_match = bcrypt.checkpw(user.password.encode(), user_db.password)

    if not is_match:
        raise HTTPException(400, "Invalid Password!")
    
    token = jwt.encode({'id': user_db.id}, 'password_key')

    return {'token': token, 'user': user_db}

@router.get('/')
def current_user_data(db: Session = Depends(get_db), user_dict = Depends(auth_middleware)):
    user = db.query(User).filter(User.id == user_dict['uid']).first()

    if not user:
        raise HTTPException(404, "User not found!")
    
    return user