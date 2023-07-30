from config.db import conn
from models.personaModel import persona
"""     
    http://127.0.0.1:8000/docs
    
    """


def get_persons():
    listPersons = conn.execute(persona.select()).fetchall()
    list = []
    for persons in listPersons:
        dicci = {
            "id_persona": persons[0],
            "nombre": persons[1],
            "apellido": persons[2],
            "genero": persons[3],
            "correo": persons[4],
            "contrasena": persons[5],
            "fecha_nacimiento": persons[6],
            "estatus": persons[7],
            "fecha_actualizacion": persons[8],
            "fecha_registro": persons[9],
        }
        list.append(dicci)
    return list


def get_person(idpersona):
    listOnePerson = conn.execute(persona.select().where(
        persona.c.id_persona == idpersona)).first()
    if listOnePerson is not None:
        dicci = {
            "id_persona": listOnePerson[0],
            "nombre": listOnePerson[1],
            "apellido": listOnePerson[2],
            "genero": listOnePerson[3],
            "correo": listOnePerson[4],
            "contrasena": listOnePerson[5],
            "fecha_nacimiento": listOnePerson[6],
            "estatus": listOnePerson[7],
            "fecha_actualizacion": listOnePerson[8],
            "fecha_registro": listOnePerson[9],
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
    res = {'message': "Persona Agregada"}
    return res


def get_update(data, idpersona):
    ip = get_person(idpersona)
    if ip.get("status") == "No existe la persona":
        return ip
    else:
        result = conn.execute(persona.update().values(
            dict(data)).where(persona.c.id_persona == idpersona))
        conn.commit()
        res = {"status": "Persona Actualizada"}
        return res
    stado = {
        "status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado


def get_deleteStatus(idpersona):
    ip = get_person(idpersona)
    if ip.get("status") == "No existe la persona":
        return ip
    else:
        result = conn.execute(persona.update().values(estatus="Inactivo").where(
            persona.c.id_persona == idpersona))
        conn.commit()
        res = {"status": "Persona desactivada"}
        return res


def get_delete(idpersona):
    ip = get_person(idpersona)
    if ip.get("status") == "No existe la persona":
        return ip
    else:
        result = conn.execute(persona.delete().where(
            persona.c.id_persona == idpersona))
        conn.commit()
        res = {"status": "Persona eliminada"}
        return res
