from sqlalchemy import Table, Column, Integer, String, Date, DateTime,Enum
from config.db import meta, engine
import datetime
editorial = Table("tbb_editorial", meta,
         Column("id_editorial", Integer, primary_key=True, autoincrement=True, nullable=False),
         Column("nombreeditorial", String(100), nullable=False),
         Column("autoresEditorial", String(100), default='Autor Anonimo'),
         Column("logoEditorial", String(250), nullable=True), # longblob
         Column("estatus", Enum('Activo', 'Inactivo'), nullable=False, default='Activo'),== 
         Column("fecha_actualizacion", DateTime, nullable=True),
         Column("fecha_registro", default=datetime.datetime.utcnow)
         )

meta.create_all(engine)