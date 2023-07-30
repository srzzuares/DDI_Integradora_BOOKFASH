from pydantic import BaseModel
from enum import Enum
from datetime import datetime


class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class recomendacionSchema(BaseModel):
    LibroId: int = 1
    PersonaId: int = 1
    estatus: EstatusEnum


class recomendacionSchemaPut(BaseModel):
    LibroId: int = 1
    PersonaId: int = 1
    estatus: EstatusEnum
    fecha_actualizacion: datetime
