from config.db import conn
from sqlalchemy import text
""" 

"""


def ViewReco():
    consulta = "SELECT * FROM view_recomendaciones;"
    exe = conn.execute(text(consulta))
    items = []
    for it in exe:
        dicci = {
            'titulolibro': it[0],
            'nombreGenero': it[1],
            'numeroestrellas': it[2]
        }
        items.append(dicci)
    return items
