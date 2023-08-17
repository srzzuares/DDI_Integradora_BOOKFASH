from pydantic import BaseModel
from enum import Enum
from datetime import datetime


class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class recomendacionSchema(BaseModel):
    id__libro: int = 1
    id_persona: int = 1
    estatus: EstatusEnum


class recomendacionSchemaPut(BaseModel):
    id__libro: int = 1
    id_persona: int = 1
    estatus: EstatusEnum
    fecha_actualizacion: datetime
