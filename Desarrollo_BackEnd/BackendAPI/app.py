from fastapi import FastAPI
from routes.personaRoute import server
from routes.generoRoute import gen
from routes.criterioRoute import criterioServer
app = FastAPI()



app.include_router(server)
app.include_router(gen)
app.include_router(criterioServer)