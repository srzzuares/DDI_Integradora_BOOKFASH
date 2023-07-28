from config.db import conn
from models.editorialModel import editorial
"""     
    http://127.0.0.1:8000
    
    """
def get_alls():
    listedits = conn.execute(editorial.select()).fetchall()
    list=[]
    for editor in listedits:
        dicci = {
            "id_editorial": editor[0],
            "nombreeditorial": editor[1],
            "autoresEditorial": editor[2],
            "logoEditorial": editor[3],
            "estatus": editor[4],
            "fecha_actualizacion": editor[5],
            "fecha_registro": editor[6]
        }
        list.append(dicci)
    return list

def get_One(ideditorial):
    listOneEdit = conn.execute(editorial.select().where(editorial.c.id_editorial == ideditorial)).first()
    if listOneEdit is not None:
        dicci = {
            "id_editorial": listOneEdit[0],
            "nombreeditorial": listOneEdit[1],
            "autoresEditorial": listOneEdit[2],
            "logoEditorial": listOneEdit[3],
            "estatus": listOneEdit[4],
            "fecha_actualizacion": listOneEdit[5],
            "fecha_registro": listOneEdit[6]
        }
        return dicci
    else:
        res = {
            "status": "No existe el editorial"
        }
        return res
    
def get_create(data):
    conn.execute(editorial.insert().values(dict(data)))
    conn.commit()
    res={'message': "Editorial Agregado"}
    return res

def get_update(data,ideditorial):
    ip = get_One(ideditorial)
    if ip.get("status") == "No existe el editorial":
        return ip
    else: 
        result = conn.execute(editorial.update().values(dict(data)).where(editorial.c.id_editorial == ideditorial))
        conn.commit()
        res = {"status": "Editorial Actualizado"}
        return res
    stado = {"status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado

def get_deleteStatus(ideditorial):
    ip = get_One(ideditorial)
    if ip.get("status") == "No existe el editorial":
        return ip
    else:
        result = conn.execute(editorial.update().values(estatus="Inactivo").where(
            editorial.c.id_editorial == ideditorial))
        conn.commit()
        res = {"status": "Editorial desactivado"}
        return res

def get_delete(ideditorial): 
    ip = get_One(ideditorial)
    if ip.get("status") == "No existe el editorial":
        return ip 
    else:
        result = conn.execute(editorial.delete().where(editorial.c.id_editorial == ideditorial))
        conn.commit()
        res = {"status": "Editorial eliminado"}
        return res