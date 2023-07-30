from config.db import conn
from models.recomendacionModel import recomendacion
"""     
    http://127.0.0.1:8000/docs
    
    """


def get_alls():
    listRecomen = conn.execute(recomendacion.select()).fetchall()
    list = []
    for Recon in listRecomen:
        dicci = {
            "id_recomendacion": Recon[0],
            "LibroId": Recon[1],
            "PersonaId": Recon[2],
            "estatus": Recon[3],
            "fecha_actualizacion": Recon[4],
            "fecha_registro": Recon[5]
        }
        list.append(dicci)
    return list


def get_One(idrecomendacion):
    listOneRecon = conn.execute(recomendacion.select().where(
        recomendacion.c.id_recomendacion == idrecomendacion)).first()
    if listOneRecon is not None:
        dicci = {
            "id_recomendacion": listOneRecon[0],
            "LibroId": listOneRecon[1],
            "PersonaId": listOneRecon[2],
            "estatus": listOneRecon[3],
            "fecha_actualizacion": listOneRecon[4],
            "fecha_registro": listOneRecon[5],
        }
        return dicci
    else:
        res = {
            "status": "No existe la recomendacion"
        }
        return res


def get_create(data):
    conn.execute(recomendacion.insert().values(dict(data)))
    conn.commit()
    res = {'message': "Recomendacion Agregado"}
    return res


def get_update(data, idrecomendacion):
    ip = get_One(idrecomendacion)
    if ip.get("status") == "No existe la recomendacion":
        return ip
    else:
        result = conn.execute(recomendacion.update().values(
            dict(data)).where(recomendacion.c.id_recomendacion == idrecomendacion))
        conn.commit()
        res = {"status": "Recomendacion Actualizado"}
        return res
    stado = {
        "status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado


def get_deleteStatus(idrecomendacion):
    ip = get_One(idrecomendacion)
    if ip.get("status") == "No existe la recomendacion":
        return ip
    else:
        result = conn.execute(recomendacion.update().values(estatus="Inactivo").where(
            recomendacion.c.id_recomendacion == idrecomendacion))
        conn.commit()
        res = {"status": "Recomendacion desactivado"}
        return res


def get_delete(idrecomendacion):
    ip = get_One(idrecomendacion)
    if ip.get("status") == "No existe la recomendacion":
        return ip
    else:
        result = conn.execute(recomendacion.delete().where(
            recomendacion.c.id_recomendacion == idrecomendacion))
        conn.commit()
        res = {"status": "Recomendacion eliminado"}
        return res
