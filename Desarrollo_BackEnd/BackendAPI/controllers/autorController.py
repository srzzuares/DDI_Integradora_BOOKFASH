from config.db import conn
from models.autorModel import autor
"""     
    http://127.0.0.1:8000/docs
    
    """


def get_Alls():
    listautor = conn.execute(autor.select()).fetchall()
    list = []
    for aut in listautor:
        dicci = {
            "id_autor": aut[0],
            "id_persona": aut[1],
            "id_libro": aut[2],
            "cantidadlibros": aut[3],
            "biografiaAutor": aut[4],
            "estatus": aut[5],
            "fecha_actualizacion": aut[6],
            "fecha_registro": aut[7],
        }
        list.append(dicci)
    return list


def get_One(idautor):
    listOneAutor = conn.execute(autor.select().where(
        autor.c.id_autor == idautor)).first()
    if listOneAutor is not None:
        dicci = {
            "id_autor": listOneAutor[0],
            "id_persona": listOneAutor[1],
            "id_libro": listOneAutor[2],
            "cantidadlibros": listOneAutor[3],
            "biografiaAutor": listOneAutor[4],
            "estatus": listOneAutor[5],
            "fecha_actualizacion": listOneAutor[6],
            "fecha_registro": listOneAutor[7],
        }
        return dicci
    else:
        res = {
            "status": "No existe el autor"
        }
        return res


def get_create(data):
    conn.execute(autor.insert().values(dict(data)))
    conn.commit()
    res = {'message': "Autor Agregada"}
    return res


def get_update(data, idautor):
    ip = get_One(idautor)
    if ip.get("status") == "No existe el autor":
        return ip
    else:
        result = conn.execute(autor.update().values(
            dict(data)).where(autor.c.id_autor == idautor))
        conn.commit()
        res = {"status": "Autor Actualizada"}
        return res


def get_deleteStatus(idautor):
    ip = get_One(idautor)
    if ip.get("status") == "No existe el autor":
        return ip
    else:
        result = conn.execute(autor.update().values(estatus="Inactivo").where(
            autor.c.id_autor == idautor))
        conn.commit()
        res = {"status": "Autor desactivado"}
        return res


def get_delete(idautor):
    ip = get_One(idautor)
    if ip.get("status") == "No existe el autor":
        return ip
    else:
        result = conn.execute(autor.delete().where(
            autor.c.id_autor == idautor))
        conn.commit()
        res = {"status": "Autor eliminada"}
        return res
