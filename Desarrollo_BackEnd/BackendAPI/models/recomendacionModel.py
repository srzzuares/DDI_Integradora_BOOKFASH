from sqlalchemy import Table, Column, Integer, String, Date, DateTime, Enum
from config.db import meta, engine
import datetime
recomendacion = Table("tbb_recomendacion", meta,
                      Column("id_recomendacion", Integer, primary_key=True,
                             autoincrement=True, nullable=False),
                      Column("id__libro", Integer, nullable=False, default=1),
                      Column("id_persona", Integer, default=1),
                      Column("estatus", Enum('Activo', 'Inactivo'),
                             nullable=False, default='Activo'),
                      Column("fecha_actualizacion", DateTime, nullable=True),
                      Column("fecha_registro", default=datetime.datetime.utcnow)
                      )

meta.create_all(engine)
