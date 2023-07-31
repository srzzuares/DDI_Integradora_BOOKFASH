from pydantic import BaseModel
from enum import Enum
from datetime import datetime


class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class autorSchema(BaseModel):
    PersonaId: int = 1
    LibroId: int = 1
    cantidadlibros: int = 1
    biografiaAutor: str = 'Biografia Anonima'
    estatus: EstatusEnum


class autorSchemaPut(BaseModel):
    PersonaId: int = 1
    LibroId: int = 1
    cantidadlibros: int = 1
    biografiaAutor: str = 'Biografia Anonima'
    estatus: EstatusEnum
    fecha_actualizacion: datetime
