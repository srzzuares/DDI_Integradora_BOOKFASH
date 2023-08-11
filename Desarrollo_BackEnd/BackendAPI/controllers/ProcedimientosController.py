from config.db import conn
from sqlalchemy import text


def get_Status():
    Consulta = "CALL sp_status_bd();"
    exe = conn.execute(text(Consulta))
    listaItems = []
    for item in exe:
        dicci = {
            "Tabla": item[0],
            "Total_Registros": item[1]
        }
        listaItems.append(dicci)
    return listaItems


def post_InsertPerson(data):
    CanPers = data.Cantidad
    Consulta = f"CALL sp_generar_personas_aleatorias({CanPers})"
    print(CanPers)
    exe = conn.execute(text(Consulta))
    res = {
        "status": "Personas Agregadas con Exito!"
    }
    return res


def del_DelPersonsAll():
    Consulta = "CALL sp_eliminar_persona();"
    exe = conn.execute(text(Consulta))
    res = {
        "status": "Personas Eliminaas con Todo el Exito!"
    }
    return res
