from sqlalchemy import Table, Column, Integer, String, Date, DateTime, Enum
from config.db import meta, engine
import datetime
autor = Table("tbb_autor", meta,
              Column("id_autor", Integer, primary_key=True,
                     autoincrement=True, nullable=False),
              Column("id_persona", Integer, nullable=False),
              Column("id_libro", Integer, nullable=False),
              Column("cantidadlibros", Integer, nullable=True, default=1),
              Column("biografiaAutor", String(205), nullable=True,
                     default="Biografia no disponible"),
              Column("estatus", Enum('Activo', 'Inactivo'),
                     nullable=False, default='Activo'),
              Column("fecha_actualizacion", DateTime, nullable=True),
              Column("fecha_registro", default=datetime.datetime.utcnow)
              )

meta.create_all(engine)
