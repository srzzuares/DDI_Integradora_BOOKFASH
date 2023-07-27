from pydantic import BaseModel
from enum import Enum
from datetime import datetime

class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class criterioSchema(BaseModel):
    nombre:str='Sin Criterio'
    descripcioncriterio:str=''
    estatus:EstatusEnum
    
class criterioSchemaPut(BaseModel):
    nombre:str='Criterio A Actualizar'
    descripcioncriterio:str=''
    estatus:EstatusEnum
    fecha_actualizacion:datetime
