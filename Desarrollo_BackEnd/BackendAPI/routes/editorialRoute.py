from fastapi import APIRouter
from schemas.editorialSchema import editorialSchema,editorialSchemaPut
from controllers.editorialController import get_alls,get_One,get_create,get_update,get_delete,get_deleteStatus
editorialServer = APIRouter()

@editorialServer.get("/editorial/get_All") 
def GET_ALL():
    return get_alls()

@editorialServer.get("/editorial/{ideditorial}")
def GET_ONE(ideditorial):
    return get_One(ideditorial)

@editorialServer.post("/editorial/insert")
def POST_editorial(data:editorialSchema):
    return get_create(data)

@editorialServer.put("/editorial/update/{ideditorial}")
def PUT_editorial(data:editorialSchemaPut,ideditorial):
    return get_update(data,ideditorial)

@editorialServer.delete("/editorial/deleteSt/{ideditorial}")
def DEL_editorialSTATUS(ideditorial):
    return get_deleteStatus(ideditorial)

@editorialServer.delete("/editorial/delete/{ideditorial}")
def DEL_editorial(ideditorial): 
    return get_delete(ideditorial)
