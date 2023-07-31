from sqlalchemy import Table, Column, Integer, String, Date, DateTime, Enum, BLOB
from config.db import meta, engine
import datetime
libro = Table("tbb_libro", meta,
              Column("id_libro", Integer, primary_key=True,
                     autoincrement=True, nullable=False),
              Column("titulolibro", String(100), nullable=False),
              Column("portada", String(2500), nullable=True),
              Column("CriterioId", Integer, nullable=True),
              Column("EditorialId", Integer, nullable=True),
              Column("GeneroId", Integer, nullable=False),
              Column("numeroPaginas", Integer, nullable=True),
              Column("fechaPublicacion", Date, nullable=True),
              Column("descripcionlibro", String(200), nullable=True),
              Column("ValoracionId", Integer, nullable=False),
              Column("estatus", Enum('Activo', 'Inactivo'),
                     nullable=False, default='Activo'),
              Column("fecha_actualizacion", DateTime, nullable=True),
              Column("fecha_registro", default=datetime.datetime.utcnow)
              )

meta.create_all(engine)
