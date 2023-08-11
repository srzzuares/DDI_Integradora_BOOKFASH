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
