from pydantic import BaseModel
from enum import Enum
from datetime import date,datetime

class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'

class GeneroEnum(str, Enum):
    Hombre = 'Hombre'
    Mujer = 'Mujer'

class personaSchema(BaseModel):
    nombre:str='Nombre'
    apellido:str='Apellido'
    genero:GeneroEnum
    correo:str='Correo@gmail.com'
    contrasena:str='1234'
    estatus:EstatusEnum
    fecha_nacimiento:date
    
class personaSchemaPut(BaseModel):
    nombre:str=''
    apellido:str=''
    genero:GeneroEnum
    correo:str=''
    contrasena:str=''
    estatus:EstatusEnum
    fecha_nacimiento:date
    fecha_actualizacion:datetime
 
 