from fastapi import APIRouter
from schemas.ProcedimientosSchemas import InsPerSchema
from controllers.ProcedimientosController import get_Status, post_InsertPerson, del_DelPersonsAll, InnerJoin
ProcessServer = APIRouter()


@ProcessServer.get("/Procc/StatusBd")
def GET_Status():
    return get_Status()


@ProcessServer.post("/Procc/InsertPersons")
def GET_InsertPerson(data: InsPerSchema):
    return post_InsertPerson(data)


@ProcessServer.delete("/Procc/DeletePersons")
def GET_DeleteAllPersons():
    return del_DelPersonsAll()


@ProcessServer.get("/Procc/InnerJoinsPersons")
def GET_INNERPersons():
    return InnerJoin()
