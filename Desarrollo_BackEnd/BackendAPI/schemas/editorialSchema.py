from pydantic import BaseModel
from enum import Enum
from datetime import datetime

class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class editorialSchema(BaseModel):
    nombreeditorial:str='Nombre del editorial'
    autoresEditorial:str='Autor Anonimo'
    logoEditorial:str='Link'
    estatus:EstatusEnum
    
class editorialSchemaPut(BaseModel):
    nombreeditorial:str='Nombre Actualizable'
    autoresEditorial:str='Autor Anonimo'
    logoEditorial:str='Link actualizable'
    estatus:EstatusEnum
    fecha_actualizacion:datetime
