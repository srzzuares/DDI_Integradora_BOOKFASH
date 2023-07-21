from fastapi import FastAPI
from routes.personaRoute import server
from routes.generoRoute import gen
app = FastAPI()



app.include_router(server)
app.include_router(gen)