from config.db import conn
from schemas.personaSchema import personaSchema
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

def get_person(idpersona):
    listOnePerson = conn.execute(persona.select().where(persona.c.id_persona == idpersona)).first()
    if listOnePerson is not None:
        dicci = {
            "id_persona": listOnePerson[0],
            "nombre": listOnePerson[1],
            "apellido": listOnePerson[2],
            "fecha_nacimiento": listOnePerson[3],
            "fecha_registro": listOnePerson[4],
            "fecha_actualizacion": listOnePerson[5],
            "estatus": listOnePerson[6]
        }
        return dicci
    else:
        res = {
            "status": "No existe la persona"
        }
        return res
    
def get_create(data):
    conn.execute(persona.insert().values(dict(data)))
    conn.commit()
    res={'message': "Student successfully"}
    return res



