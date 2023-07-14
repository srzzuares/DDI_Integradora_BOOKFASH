from sqlalchemy import Table, Column, Integer, String, Boolean, Date, Sequence
from config.db import meta, engine

persona = Table("persona", meta,
                Column("id_persona", Integer, Sequence('persona_id_seq'), primary_key=True),
                Column("nombre", String(100)),
                Column("apellido", String(100)),
                Column("fecha_nacimiento", Date),
                Column("fecha_registro", Date),
                Column("fecha_actualizacion", Date),
                Column("estatus", Boolean)
            )

meta.create_all(engine)