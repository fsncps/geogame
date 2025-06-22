# game/db.py

import os
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, Session

# Load DB connection string from environment variable
DB_URL = os.getenv("GEOGAME_DB_URL")

# Ensure pymysql is used if the user provided a mysql:// URL
if DB_URL and DB_URL.startswith("mysql://"):
    DB_URL = DB_URL.replace("mysql://", "mysql+pymysql://", 1)

# Create the database engine
engine = create_engine(DB_URL, echo=False, pool_pre_ping=True)

# Create a session factory
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

def get_db() -> Session:
    """
    Yield a new SQLAlchemy database session and ensure it's closed properly.
    Intended for use with `with`-like context or manual iteration.
    """
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

