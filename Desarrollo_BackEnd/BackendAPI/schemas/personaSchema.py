from pydantic import BaseModel
from enum import Enum
from datetime import date,datetime

class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class personaSchema(BaseModel):
    nombre:str
    apellido:str
    correo:str
    contrasena:str
    estatus:EstatusEnum
    fecha_nacimiento:date
    
class personaSchemaPut(BaseModel):
    nombre:str
    apellido:str
    correo:str
    contrasena:str
    estatus:EstatusEnum
    fecha_nacimiento:date
    fecha_actualizacion:datetime
 
 