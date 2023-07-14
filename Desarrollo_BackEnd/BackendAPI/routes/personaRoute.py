from fastapi import APIRouter
from config.db import conn
# from models.personaModel import persona
# from controllers.personaController import ctll
# from schemas.personaSchema import personaSchema
server = APIRouter()


#get persona

@server.get("/persona")
async def get_persona():
    persona = "Hola"
    return persona


