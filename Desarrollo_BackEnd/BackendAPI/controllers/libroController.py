from config.db import conn
from models.libroModel import libro
"""     
    http://127.0.0.1:8000/docs
    
    """


def get_Alls():
    listLibros = conn.execute(libro.select()).fetchall()
    list = []
    for lib in listLibros:
        dicci = {
            "id_libro": lib[0],
            "titulolibro": lib[1],
            "portada": lib[2],
            "CriterioId": lib[3],
            "EditorialId": lib[4],
            "GeneroId": lib[5],
            "numeroPaginas": lib[6],
            "fechaPublicacion": lib[7],
            "descripcionlibro": lib[8],
            "ValoracionId": lib[9],
            "estatus": lib[10],
            "fecha_actualizacion": lib[11],
            "fecha_registro": lib[12]
        }
        list.append(dicci)
    return list


def get_One(idlibro):
    listOnePerson = conn.execute(libro.select().where(
        libro.c.id_libro == idlibro)).first()
    if listOnePerson is not None:
        dicci = {
            "id_libro": listOnePerson[0],
            "titulolibro": listOnePerson[1],
            "portada": listOnePerson[2],
            "CriterioId": listOnePerson[3],
            "EditorialId": listOnePerson[4],
            "GeneroId": listOnePerson[5],
            "numeroPaginas": listOnePerson[6],
            "fechaPublicacion": listOnePerson[7],
            "descripcionlibro": listOnePerson[8],
            "ValoracionId": listOnePerson[9],
            "estatus": listOnePerson[10],
            "fecha_actualizacion": listOnePerson[11],
            "fecha_registro": listOnePerson[12]
        }
        return dicci
    else:
        res = {
            "status": "No existe el libro"
        }
        return res


def get_create(data):
    conn.execute(libro.insert().values(dict(data)))
    conn.commit()
    res = {'message': "Libro Agregado"}
    return res


def get_update(data, idlibro):
    ip = get_One(idlibro)
    if ip.get("status") == "No existe el libro":
        return ip
    else:
        result = conn.execute(libro.update().values(
            dict(data)).where(libro.c.id_libro == idlibro))
        conn.commit()
        res = {"status": "Libro Actualizado"}
        return res
    stado = {
        "status": "Valores no actualizados, esto se debe porque los elementos son únicos"}
    return stado


def get_deleteStatus(idlibro):
    ip = get_One(idlibro)
    if ip.get("status") == "No existe el libro":
        return ip
    else:
        result = conn.execute(libro.update().values(estatus="Inactivo").where(
            libro.c.id_libro == idlibro))
        conn.commit()
        res = {"status": "Libro desactivado"}
        return res


def get_delete(idlibro):
    ip = get_One(idlibro)
    if ip.get("status") == "No existe el libro":
        return ip
    else:
        result = conn.execute(libro.delete().where(
            libro.c.id_libro == idlibro))
        conn.commit()
        res = {"status": "Libro eliminado"}
        return res
