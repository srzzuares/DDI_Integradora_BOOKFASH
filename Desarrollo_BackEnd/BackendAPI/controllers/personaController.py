from config.db import conn
from models.personaModel import persona
"""     
    http://127.0.0.1:8000
    
    """
def get_persons():
    listPersons = conn.execute(persona.select()).fetchall()
    print(listPersons)
    list=[]
    for persons in listPersons:
        dicci = {
            "id_persona": persons[0],
            "nombre": persons[1],
            "apellido": persons[2],
            "correo": persons[3],
            "contrasena": persons[4],
            "estatus": persons[5],
            "fecha_nacimiento": persons[6],
            "fecha_actualizacion": persons[7],
            "fecha_registro": persons[8],
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
            "correo": listOnePerson[3],
            "contrasena": listOnePerson[4],
            "estatus": listOnePerson[5],
            "fecha_nacimiento": listOnePerson[6],
            "fecha_actualizacion": listOnePerson[7],
            "fecha_registro": listOnePerson[8],
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
    res={'message': "Persona Agregada"}
    return res

def get_update(data,idpersona):
    ip = get_person(idpersona)
    print(ip)
    if ip.get("status") == "No existe la persona":
        return ip
    else: 
        result = conn.execute(persona.update().values(dict(data)).where(persona.c.id_persona == idpersona))
        conn.commit()
        return result.last_updated_params()
    res = {"status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return res

def get_deleteStatus(idpersona):
    ip = get_person(idpersona)
    if ip.get("status") == "No existe la persona":
        return ip
    else:
        result = conn.execute(persona.update().values(estatus="Inactivo").where(
            persona.c.id_persona == idpersona))
        conn.commit()
        res = {"status": "Persona eliminada"}
        return res

def get_delete(idpersona): 
  ip = get_person(idpersona)
  if ip.get("status") == "No existe la persona":
     return ip 
  else:
    result = conn.execute(persona.delete().where(persona.c.id_persona == idpersona))
    conn.commit()
    res = {"status": "Persona eliminada"}
    return res