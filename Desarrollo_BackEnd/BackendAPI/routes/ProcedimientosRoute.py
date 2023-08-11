from fastapi import APIRouter
from controllers.Procedimientos import get_Status
ProcessServer = APIRouter()


@ProcessServer.get("/Procc/StatusBd")
def GET_Status():
    return get_Status()
