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
    res={'message': "Presona Agregada"}
    return res

def get_update(data,idpersona):
    ip = get_person(idpersona)
    console.log(ip)
    if ip.get("status") == "No existe la persona"
      return ip
    else: 
      result = conn.execute(persona.update().values(dict(data)).where(persona.c.id_persona == idpersona))
      conn.commit()
    return result.last_update_params()

def get_delete(idpersona): 
  ip = get_person(idpersona)
  if ip.get("status") == "No existe la persona"
     return ip 
  else:
    result = conn.execute(persona.delete().where(persona.c.id_persona == idpersona))
    conn.commit()
    res = {"status": "Persona eliminada"}
    return res