from fastapi import APIRouter
from schemas.generoSchema import generoSchema,generoSchemaPut
from controllers.generoController import get_alls,get_One,get_create,get_update,get_delete,get_deleteStatus
gen = APIRouter()

@gen.get("/genero/get_All") 
def GET_ALL():
    return get_alls()

@gen.get("/genero/{idgenero}")
def GET_ONE(idgenero):
    return get_One(idgenero)

@gen.post("/genero/insert")
def POST_PERSON(data:generoSchema):
    return get_create(data)

@gen.put("/genero/update/{idgenero}")
def PUT_PERSON(data:generoSchemaPut,idgenero):
    return get_update(data,idgenero)

@gen.delete("/genero/deleteSt/{idgenero}")
def DEL_PERSONSTATUS(idgenero):
    return get_deleteStatus(idgenero)

@gen.delete("/genero/delete/{idgenero}")
def DEL_PERSON(idgenero): 
    return get_delete(idgenero)