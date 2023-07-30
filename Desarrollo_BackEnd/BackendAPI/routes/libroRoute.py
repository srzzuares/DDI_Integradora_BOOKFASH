from fastapi import APIRouter
from schemas.libroSchema import libroSchema, libroSchemaPut
from controllers.libroController import get_Alls, get_One, get_create, get_update, get_delete, get_deleteStatus
libroServer = APIRouter()

# get libro


@libroServer.get("/libro/get_All")
def GET_ALL():
    return get_Alls()


@libroServer.get("/libro/{idlibro}")
def GET_ONE(idlibro):
    return get_One(idlibro)


@libroServer.post("/libro/insert")
def POST_LIBRO(data: libroSchema):
    return get_create(data)


@libroServer.put("/libro/update/{idlibro}")
def PUT_LIBRO(data: libroSchemaPut, idlibro):
    return get_update(data, idlibro)


@libroServer.delete("/libro/deleteSt/{idlibro}")
def DEL_LIBROSTATUS(idlibro):
    return get_deleteStatus(idlibro)


@libroServer.delete("/libro/delete/{idlibro}")
def DEL_LIBRO(idlibro):
    return get_delete(idlibro)
