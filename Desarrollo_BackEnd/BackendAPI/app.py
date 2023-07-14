from fastapi import FastAPI
from routes.personaRoute import server
app = FastAPI()



app.include_router(server)