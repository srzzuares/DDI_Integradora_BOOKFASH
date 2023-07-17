from fastapi import APIRouter
from schemas.personaSchema import personaSchema,personaSchemaPut
from controllers.personaController import get_persons,get_person,get_create,get_update,get_delete,get_deleteStatus
personServer = APIRouter()

#get persona

@personServer.get("/persona/get_All") 
def GET_ALL():
    return get_persons()

@personServer.get("/persona/{idpersona}")
def GET_ONE(idpersona):
    return get_person(idpersona)

@personServer.post("/persona/insert")
def POST_PERSON(data:personaSchema):
    return get_create(data)

@personServer.put("/persona/update/{idpersona}")
def PUT_PERSON(data:personaSchemaPut,idpersona):
    return get_update(data,idpersona)

@personServer.delete("/persona/deleteSt/{idpersona}")
def DEL_PERSONSTATUS(idpersona):
    return get_deleteStatus(idpersona)

@personServer.delete("/persona/delete/{idpersona}")
def DEL_PERSON(idpersona): 
    return get_delete(idpersona)


