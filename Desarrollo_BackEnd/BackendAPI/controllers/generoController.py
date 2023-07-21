from config.db import conn
from models.generoModel import genero
"""     
    http://127.0.0.1:8000
    
    """
def get_alls():
    listGene = conn.execute(genero.select()).fetchall()
    list=[]
    for Gene in listGene:
        dicci = {
            "id_genero": Gene[0],
            "nombreGenero": Gene[1],
            "GeneroPadre": Gene[2],
            "estatus": Gene[3],
            "fecha_actualizacion": Gene[4],
            "fecha_registro": Gene[5],
        }
        list.append(dicci)
    return list

def get_One(idgenero):
    listOneGene = conn.execute(genero.select().where(genero.c.id_genero == idgenero)).first()
    if listOneGene is not None:
        dicci = {
            "id_genero": listOneGene[0],
            "nombreGenero": listOneGene[1],
            "GeneroPadre": listOneGene[2],
            "estatus": listOneGene[3],
            "fecha_actualizacion": listOneGene[4],
            "fecha_registro": listOneGene[5],
        }
        return dicci
    else:
        res = {
            "status": "No existe el genero"
        }
        return res
    
def get_create(data):
    conn.execute(genero.insert().values(dict(data)))
    conn.commit()
    res={'message': "Genero agregado"}
    return res

def get_update(data,idgenero):
    ip = get_One(idgenero)
    if ip.get("status") == "No existe el genero":
        return ip
    else: 
        result = conn.execute(genero.update().values(dict(data)).where(genero.c.id_genero == idgenero))
        conn.commit()
        res = {"status": "Genero actualizado"}
        return res
    stado = {"status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado

def get_deleteStatus(idgenero):
    ip = get_One(idgenero)
    if ip.get("status") == "No existe la genero":
        return ip
    else:
        result = conn.execute(genero.update().values(estatus="Inactivo").where(
            genero.c.id_genero == idgenero))
        conn.commit()
        res = {"status": "Genero desactivado"}
        return res

def get_delete(idgenero): 
    ip = get_One(idgenero)
    if ip.get("status") == "No existe el genero":
        return ip 
    else:
        result = conn.execute(genero.delete().where(genero.c.id_genero == idgenero))
        conn.commit()
        res = {"status": "Genero eliminado"}
        return res