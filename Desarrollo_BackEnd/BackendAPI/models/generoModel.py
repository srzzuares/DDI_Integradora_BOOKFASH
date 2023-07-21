from sqlalchemy import Table, Column, Integer, String, Date, DateTime,Enum
from config.db import meta, engine
import datetime
genero = Table("tbb_genero", meta,
         Column("id_genero", Integer, primary_key=True, autoincrement=True, nullable=False),
         Column("nombreGenero", String(50), nullable=False),
         Column("GeneroPadre", String(50), nullable=True),
         Column("estatus", Enum('Activo', 'Inactivo'), nullable=False, default='Activo'),
         Column("fecha_actualizacion", DateTime, nullable=True),
         Column("fecha_registro", default=datetime.datetime.utcnow)
         )

meta.create_all(engine)