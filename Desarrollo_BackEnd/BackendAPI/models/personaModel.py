from sqlalchemy import Table, Column, Integer, String, Date, DateTime,Enum
from config.db import meta, engine
import datetime
persona = Table("persona", meta,
         Column("id_persona", Integer, primary_key=True, autoincrement=True, nullable=False),
         Column("nombre", String(100), nullable=False),
         Column("apellido", String(100), nullable=False),
         Column("correo", String(100), nullable=False,unique=True),
         Column("contrasena", String(45), nullable=False),
         Column("estatus", Enum('Activo', 'Inactivo'), nullable=False, default='Activo'),
         Column("fecha_nacimiento", Date, nullable=False),
         Column("fecha_actualizacion", DateTime, nullable=True),
         Column("fecha_registro", default=datetime.datetime.utcnow)
         )

meta.create_all(engine)