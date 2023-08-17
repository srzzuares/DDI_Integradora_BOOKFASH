from fastapi import APIRouter
from controllers.ViewRecomendacionController import ViewReco
viewsServer = APIRouter()


@viewsServer.get('/view/recomendaciones')
def GET_VIEW():
    return ViewReco()
