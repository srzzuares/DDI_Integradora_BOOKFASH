from fastapi import APIRouter
from schemas.valoracionSchema import valoracionSchema, valoracionSchemaPut
from controllers.valoracionController import get_alls, get_One, get_create, get_update, get_delete, get_deleteStatus
valoracionServer = APIRouter()


@valoracionServer.get("/valoracion/get_All")
def GET_ALL():
    return get_alls()


@valoracionServer.get("/valoracion/{idvaloracion}")
def GET_ONE(idvaloracion):
    return get_One(idvaloracion)


@valoracionServer.post("/valoracion/insert")
def POST_valoracion(data: valoracionSchema):
    return get_create(data)


@valoracionServer.put("/valoracion/update/{idvaloracion}")
def PUT_valoracion(data: valoracionSchemaPut, idvaloracion):
    return get_update(data, idvaloracion)


@valoracionServer.delete("/valoracion/deleteSt/{idvaloracion}")
def DEL_valoracionSTATUS(idvaloracion):
    return get_deleteStatus(idvaloracion)


@valoracionServer.delete("/valoracion/delete/{idvaloracion}")
def DEL_valoracion(idvaloracion):
    return get_delete(idvaloracion)
