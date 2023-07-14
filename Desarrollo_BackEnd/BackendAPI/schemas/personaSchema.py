from pydantic import BaseModel
from datetime import date,datetime
class personaSchema(BaseModel):
    nombre:str
    apellido:str
    fecha_nacimiento:datetime
    fecha_actualizacion:date
    estatus:bool
 