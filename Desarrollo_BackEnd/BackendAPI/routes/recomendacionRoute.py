from fastapi import APIRouter
from schemas.recomendacionSchema import recomendacionSchema, recomendacionSchemaPut
from controllers.recomendacionController import get_alls, get_One, get_create, get_update, get_delete, get_deleteStatus
recomendacionServer = APIRouter()

# get recomendacion


@recomendacionServer.get("/recomendacion/get_All")
def GET_ALL():
    return get_alls()


@recomendacionServer.get("/recomendacion/{idrecomendacion}")
def GET_ONE(idrecomendacion):
    return get_One(idrecomendacion)


@recomendacionServer.post("/recomendacion/insert")
def POST_recomendacion(data: recomendacionSchema):
    return get_create(data)


@recomendacionServer.put("/recomendacion/update/{idrecomendacion}")
def PUT_recomendacion(data: recomendacionSchemaPut, idrecomendacion):
    return get_update(data, idrecomendacion)


@recomendacionServer.delete("/recomendacion/deleteSt/{idrecomendacion}")
def DEL_recomendacionSTATUS(idrecomendacion):
    return get_deleteStatus(idrecomendacion)


@recomendacionServer.delete("/recomendacion/delete/{idrecomendacion}")
def DEL_recomendacion(idrecomendacion):
    return get_delete(idrecomendacion)
