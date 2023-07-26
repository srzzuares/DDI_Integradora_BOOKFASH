from fastapi import APIRouter
from schemas.criterioSchema import criterioSchema,criterioSchemaPut
from controllers.criterioController import get_criterios,get_criterio,get_create,get_update,get_delete,get_deleteStatus
criterioServer = APIRouter()

#get criterio

@criterioServer.get("/criterio/get_All") 
def GET_ALL():
    return get_criterios()

@criterioServer.get("/criterio/{idcriterio}")
def GET_ONE(idcriterio):
    return get_criterio(idcriterio)

@criterioServer.post("/criterio/insert")
def POST_CRITERIO(data:criterioSchema):
    return get_create(data)

@criterioServer.put("/criterio/update/{idcriterio}")
def PUT_CRITERIO(data:criterioSchemaPut,idcriterio):
    return get_update(data,idcriterio)

@criterioServer.delete("/criterio/deleteSt/{idcriterio}")
def DEL_CRITERIOSTATUS(idcriterio):
    return get_deleteStatus(idcriterio)

@criterioServer.delete("/criterio/delete/{idcriterio}")
def DEL_CRITERIO(idcriterio): 
    return get_delete(idcriterio)


