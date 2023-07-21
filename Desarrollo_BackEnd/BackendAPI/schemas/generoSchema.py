from pydantic import BaseModel
from enum import Enum
from datetime import datetime

class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class generoSchema(BaseModel):
    nombreGenero:str='Accion'
    GeneroPadre:int=0
    estatus:EstatusEnum
    
class generoSchemaPut(BaseModel):
    nombreGenero:str='Accion'
    GeneroPadre:int=0
    estatus:EstatusEnum
    fecha_actualizacion:datetime
