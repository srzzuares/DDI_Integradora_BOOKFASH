from config.db import conn
# from schemas.personaSchema import personaSchema
from models.personaModel import persona
"""     
    http://127.0.0.1:8000
    
    """
def get_persons():
    listPersons = conn.execute(persona.select()).fetchall()
    list=[]
    for persons in listPersons:
        dicci = {
            "id_persona": persons[0],
            "nombre": persons[1],
            "apellido": persons[2],
            "fecha_nacimiento": persons[3],
            "fecha_registro": persons[4],
            "fecha_actualizacion": persons[5],
            "estatus": persons[6]
        }
        list.append(dicci)
    return list