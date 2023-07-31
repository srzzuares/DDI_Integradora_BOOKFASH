from fastapi import APIRouter
from schemas.autorSchema import autorSchema, autorSchemaPut
from controllers.autorController import get_Alls, get_One, get_create, get_update, get_delete, get_deleteStatus
autorServer = APIRouter()


@autorServer.get("/autor/get_All")
def GET_ALL():
    return get_Alls()


@autorServer.get("/autor/{idautor}")
def GET_ONE(idautor):
    return get_One(idautor)


@autorServer.post("/autor/insert")
def POST_autor(data: autorSchema):
    return get_create(data)


@autorServer.put("/autor/update/{idautor}")
def PUT_autor(data: autorSchemaPut, idautor):
    return get_update(data, idautor)


@autorServer.delete("/autor/deleteSt/{idautor}")
def DEL_autorSTATUS(idautor):
    return get_deleteStatus(idautor)


@autorServer.delete("/autor/delete/{idautor}")
def DEL_autor(idautor):
    return get_delete(idautor)
