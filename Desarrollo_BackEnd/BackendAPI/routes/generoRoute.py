from fastapi import APIRouter
from schemas.generoSchema import generoSchema,generoSchemaPut
from controllers.generoController import get_alls,get_One,get_create,get_update,get_delete,get_deleteStatus
generoServer = APIRouter()

@generoServer.get("/genero/get_All") 
def GET_ALL():
    return get_alls()

@generoServer.get("/genero/{idgenero}")
def GET_ONE(idgenero):
    return get_One(idgenero)

@generoServer.post("/genero/insert")
def POST_GENERO(data:generoSchema):
    return get_create(data)

@generoServer.put("/genero/update/{idgenero}")
def PUT_GENERO(data:generoSchemaPut,idgenero):
    return get_update(data,idgenero)

@generoServer.delete("/genero/deleteSt/{idgenero}")
def DEL_GENEROSTATUS(idgenero):
    return get_deleteStatus(idgenero)

@generoServer.delete("/genero/delete/{idgenero}")
def DEL_GENERO(idgenero): 
    return get_delete(idgenero)
