from fastapi import APIRouter
from schemas.personaSchema import personaSchema
from controllers.personaController import get_persons,get_person,get_create,get_update,get_delete
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

@server.put("/persona/update/{idpersona}")
def PUT_PERSON(data:personaSchema,idpersona):
    return get_update(data,idpersona)

@server.delete("/persona/delete/{idpersona}")
def DEL_PERSON(idpersona): 
  return get_delete(idpersona)


