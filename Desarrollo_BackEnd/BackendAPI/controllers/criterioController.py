from config.db import conn
from models.criterioModel import criterio
"""     
    http://127.0.0.1:8000
    
    """
def get_criterios():
    listCrits = conn.execute(criterio.select()).fetchall()
    list=[]
    for crite in listCrits:
        dicci = {
            "id_criterio": crite[0],
            "nombre": crite[1],
            "descripcioncriterio": crite[2],
            "estatus": crite[3],
            "fecha_actualizacion": crite[4],
            "fecha_registro": crite[5]
        }
        list.append(dicci)
    return list

def get_criterio(idcriterio):
    listOneCrite = conn.execute(criterio.select().where(criterio.c.id_criterio == idcriterio)).first()
    if listOneCrite is not None:
        dicci = {
            "id_criterio": listOneCrite[0],
            "nombre": listOneCrite[1],
            "descripcioncriterio": listOneCrite[2],
            "estatus": listOneCrite[3],
            "fecha_actualizacion": listOneCrite[4],
            "fecha_registro": listOneCrite[5],
        }
        return dicci
    else:
        res = {
            "status": "No existe el criterio"
        }
        return res
    
def get_create(data):
    conn.execute(criterio.insert().values(dict(data)))
    conn.commit()
    res={'message': "Criterio Agregado"}
    return res

def get_update(data,idcriterio):
    ip = get_criterio(idcriterio)
    if ip.get("status") == "No existe el criterio":
        return ip
    else: 
        result = conn.execute(criterio.update().values(dict(data)).where(criterio.c.id_criterio == idcriterio))
        conn.commit()
        res = {"status": "Criterio Actualizado"}
        return res
    stado = {"status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado

def get_deleteStatus(idcriterio):
    ip = get_criterio(idcriterio)
    if ip.get("status") == "No existe el criterio":
        return ip
    else:
        result = conn.execute(criterio.update().values(estatus="Inactivo").where(
            criterio.c.id_criterio == idcriterio))
        conn.commit()
        res = {"status": "Criterio desactivado"}
        return res

def get_delete(idcriterio): 
    ip = get_criterio(idcriterio)
    if ip.get("status") == "No existe el criterio":
        return ip 
    else:
        result = conn.execute(criterio.delete().where(criterio.c.id_criterio == idcriterio))
        conn.commit()
        res = {"status": "Criterio eliminado"}
        return res