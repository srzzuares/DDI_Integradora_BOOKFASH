from pydantic import BaseModel
from enum import Enum
from datetime import date, datetime


class EstatusEnum(str, Enum):
    Activo = 'Activo'
    Inactivo = 'Inactivo'


class libroSchema(BaseModel):
    titulolibro: str = 'Nombre'
    portada: str = 'Link'
    CriterioId: int = 1
    EditorialId: int = 1
    GeneroId: int = 1
    numeroPaginas: int = 200
    fechaPublicacion: date
    descripcionlibro: str = 'Sin Descripcion'
    ValoracionId: int = 1
    estatus: EstatusEnum


class libroSchemaPut(BaseModel):
    titulolibro: str = 'Nombre'
    portada: str = 'Link'
    CriterioId: int = 1
    EditorialId: int = 1
    GeneroId: int = 1
    numeroPaginas: int = 200
    fechaPublicacion: date
    descripcionlibro: str = 'Sin Descripcion'
    ValoracionId: int = 1
    estatus: EstatusEnum
    fecha_actualizacion: datetime
