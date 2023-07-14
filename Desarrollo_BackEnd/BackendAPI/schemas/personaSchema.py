from pydantic import BaseModel
from datetime import datetime
class persona(BaseModel):
    nombre:str
    apellido:str
    fecha_nacimiento:datetime
    fecha_registro:datetime
    fecha_actualizacion:datetime
    estatus:bool
 