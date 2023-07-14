from fastapi import APIRouter
from controllers.personaController import get_persons
server = APIRouter()


#get persona

@server.get("/persona/get_All") 
def GET_ALL():
    return get_persons()








