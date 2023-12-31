from fastapi import FastAPI
from routes.personaRoute import personServer
from routes.generoRoute import generoServer
from routes.criterioRoute import criterioServer
from routes.editorialRoute import editorialServer
from routes.valoracionRoute import valoracionServer
from routes.libroRoute import libroServer
from routes.recomendacionRoute import recomendacionServer
from routes.autorRoute import autorServer
from routes.ProcedimientosRoute import ProcessServer
from routes.ViewRecomendacionRoute import viewsServer
app = FastAPI()

app.include_router(viewsServer, tags=['Sistema de Recomendacion de libros'])
app.include_router(ProcessServer, tags=['Consultas Avanzadas'])
app.include_router(personServer, tags=['Tabla de Personas'])
app.include_router(generoServer, tags=['Tabla de Genero'])
app.include_router(criterioServer, tags=['Tabla de Criterio'])
app.include_router(editorialServer, tags=['Tabla de Editorial'])
app.include_router(valoracionServer, tags=['Tabla de Valoracion'])
app.include_router(libroServer, tags=['Tabla de Libro'])
app.include_router(recomendacionServer, tags=['Tabla de Recomendacion'])
app.include_router(autorServer, tags=['Tabla de Autor'])
