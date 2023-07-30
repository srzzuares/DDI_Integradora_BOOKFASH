from config.db import conn
from models.valoracionModel import valoracion
"""     
    http://127.0.0.1:8000
    
    """


def get_alls():
    listValo = conn.execute(valoracion.select()).fetchall()
    list = []
    for Valo in listValo:
        dicci = {
            "id_valoracion": Valo[0],
            "PersonaId": Valo[1],
            "numeroestrellas": Valo[2],
            "estatus": Valo[3],
            "fecha_actualizacion": Valo[4],
            "fecha_registro": Valo[5],
        }
        list.append(dicci)
    return list


def get_One(idvaloracion):
    listOneValo = conn.execute(valoracion.select().where(
        valoracion.c.id_valoracion == idvaloracion)).first()
    if listOneValo is not None:
        dicci = {
            "id_valoracion": listOneValo[0],
            "PersonaId": listOneValo[1],
            "numeroestrellas": listOneValo[2],
            "estatus": listOneValo[3],
            "fecha_actualizacion": listOneValo[4],
            "fecha_registro": listOneValo[5],
        }
        return dicci
    else:
        res = {
            "status": "No existe la valoracion"
        }
        return res


def get_create(data):
    conn.execute(valoracion.insert().values(dict(data)))
    conn.commit()
    res = {'message': "valoracion agregado"}
    return res


def get_update(data, idvaloracion):
    ip = get_One(idvaloracion)
    if ip.get("status") == "No existe la valoracion":
        return ip
    else:
        result = conn.execute(valoracion.update().values(
            dict(data)).where(valoracion.c.id_valoracion == idvaloracion))
        conn.commit()
        res = {"status": "Valoracion actualizado"}
        return res
    stado = {
        "status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado


def get_deleteStatus(idvaloracion):
    ip = get_One(idvaloracion)
    if ip.get("status") == "No existe la valoracion":
        return ip
    else:
        result = conn.execute(valoracion.update().values(estatus="Inactivo").where(
            valoracion.c.id_valoracion == idvaloracion))
        conn.commit()
        res = {"status": "Valoracion desactivado"}
        return res


def get_delete(idvaloracion):
    ip = get_One(idvaloracion)
    if ip.get("status") == "No existe la valoracion":
        return ip
    else:
        result = conn.execute(valoracion.delete().where(
            valoracion.c.id_valoracion == idvaloracion))
        conn.commit()
        res = {"status": "valoracion eliminado"}
        return res
