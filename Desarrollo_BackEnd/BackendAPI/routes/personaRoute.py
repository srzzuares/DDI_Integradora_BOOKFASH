from fastapi import APIRouter
from schemas.personaSchema import personaSchema
from controllers.personaController import get_persons,get_person,get_create
server = APIRouter()

#get persona

@server.get("/persona/get_All") 
def GET_ALL():
    return get_persons()

@server.get("/persona/{idpersona}")
def GET_ONE(idpersona):
    return get_person(idpersona)

@server.post("/persona/insert")
def POST_PERSON(data:personaSchema):
    return get_create(data)






