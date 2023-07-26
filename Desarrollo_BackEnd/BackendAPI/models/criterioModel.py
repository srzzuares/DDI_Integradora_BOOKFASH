from sqlalchemy import Table, Column, Integer, String, Date, DateTime,Enum
from config.db import meta, engine
import datetime
genero = Table("tbb_criterio", meta,
         Column("id_criterio", Integer, primary_key=True, autoincrement=True, nullable=False),
         Column("nombre", String(100), default='Anonimo'),
         Column("descripcioncriterio", String(200), default='Sin Criterio'),
         Column("estatus", Enum('Activo', 'Inactivo'), nullable=False, default='Activo'),
         Column("fecha_actualizacion", DateTime, nullable=True),
         Column("fecha_registro", default=datetime.datetime.utcnow)
         )

meta.create_all(engine)