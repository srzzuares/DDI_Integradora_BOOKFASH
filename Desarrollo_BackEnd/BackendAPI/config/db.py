from sqlalchemy import create_engine, MetaData
engine = create_engine("mysql+pymysql://root:d3s4rroll0\"\".@localhost:3306/bookfash")
meta = MetaData()
conn = engine.connect()