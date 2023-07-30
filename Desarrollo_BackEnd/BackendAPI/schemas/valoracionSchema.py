from pydantic import BaseModel
from enum import Enum
from datetime import datetime


class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class valoracionSchema(BaseModel):
    PersonaId: int = 1
    numeroestrellas: int = 5
    estatus: EstatusEnum


class valoracionSchemaPut(BaseModel):
    PersonaId: int = 1
    numeroestrellas: int = 5
    estatus: EstatusEnum
    fecha_actualizacion: datetime
