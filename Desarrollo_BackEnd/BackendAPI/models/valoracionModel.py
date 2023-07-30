from sqlalchemy import Table, Column, Integer, Date, DateTime, Enum
from config.db import meta, engine
import datetime
valoracion = Table("tbb_valoracion", meta,
                   Column("id_valoracion", Integer, primary_key=True,
                          autoincrement=True, nullable=False),
                   Column("PersonaId", Integer, nullable=False),
                   Column("numeroestrellas", Integer, nullable=True),
                   Column("estatus", Enum('Activo', 'Inactivo'),
                          nullable=False, default='Activo'),
                   Column("fecha_actualizacion", DateTime, nullable=True),
                   Column("fecha_registro", default=datetime.datetime.utcnow)
                   )

meta.create_all(engine)
