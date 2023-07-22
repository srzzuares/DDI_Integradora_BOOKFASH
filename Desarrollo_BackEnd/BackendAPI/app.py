from fastapi import FastAPI
from routes.personaRoute import personServer
from routes.generoRoute import generoServer
from routes.criterioRoute import criterioServer
app = FastAPI()



app.include_router(personServer)
app.include_router(generoServer)
app.include_router(criterioServer)