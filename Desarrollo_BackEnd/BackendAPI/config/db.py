import os
from dotenv import load_dotenv
from sqlalchemy import create_engine, MetaData
load_dotenv()
engine = create_engine(os.getenv('DBMANAGER'))
meta = MetaData()
conn = engine.connect()
