from sqlalchemy import Table, Column, Integer, String, Date, DateTime,Enum
from config.db import meta, engine
import datetime
persona = Table("tbb_persona", meta,
         Column("id_persona", Integer, primary_key=True, autoincrement=True, nullable=False),
         Column("nombre", String(50), nullable=False),
         Column("apellido", String(50), nullable=False),
         Column("genero", Enum('Hombre', 'Mujer'), nullable=False, default='Hombre'),
         Column("correo", String(50), nullable=False,unique=True),
         Column("contrasena", String(45), nullable=False),
         Column("fecha_nacimiento", Date, nullable=False),
         Column("estatus", Enum('Activo', 'Inactivo'), nullable=False, default='Activo'),
         Column("fecha_actualizacion", DateTime, nullable=True),
         Column("fecha_registro", default=datetime.datetime.utcnow)
         )

meta.create_all(engine)