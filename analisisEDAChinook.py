#Grupo Equis - Gabriel Chang y Ernesto Alaniz - UAM
#graficos de eda
import pyodbc

try:
    # Establecer la conexión a la base de datos Chinook
    connection = pyodbc.connect(
        'DRIVER={SQL Server};SERVER=.;DATABASE=ChinookProd;Trusted_Connection=yes'
    )
    
    print("Grupo Equis - Gabriel Chang y Ernesto Alaniz")
    print("Conexión exitosa.")
    
    cursor = connection.cursor()
    
    # Obtener el nombre de la base de datos y la fecha de creación
    cursor.execute("SELECT DB_NAME() AS DatabaseName, create_date AS CreationDate FROM sys.databases WHERE name=DB_NAME();")
    db_info = cursor.fetchone()
    print("Nombre de la base de datos: {}".format(db_info[0]))
    print("Fecha de creación de la base de datos: {}".format(db_info[1]), '\n')
    
    # Obtener la cantidad de tablas y sus nombres
    cursor.execute("""
    SELECT TABLE_NAME
    FROM INFORMATION_SCHEMA.TABLES
    WHERE TABLE_TYPE = 'BASE TABLE'
    """)
    tables = cursor.fetchall()
    print(f"Cantidad de tablas: {len(tables)}")
    print("Nombres de las tablas, tamaño en disco y sus columnas:")
    for table in tables:
        table_name = table[0]
        
        # Obtener el tamaño en disco de la tabla
        cursor.execute(f"""
        SELECT SUM(reserved_page_count) * 8.0 / 1024
        FROM sys.dm_db_partition_stats
        WHERE object_id = OBJECT_ID('{table_name}')
        """)
        table_size_kb = cursor.fetchone()[0]
        
        print(f"\nNombre de la tabla: {table_name}, Tamaño en disco: {table_size_kb:.2f} KB")
        
        # Obtener las columnas de la tabla
        cursor.execute(f"""
        SELECT COLUMN_NAME, DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = '{table_name}'
        """)
        columns = cursor.fetchall()
        for column in columns:
            column_name, data_type = column
            print(f"Columna '{column_name}' -> ({data_type})")
    
    # Obtener información sobre las relaciones entre las tablas
    cursor.execute("""
    SELECT
        FK.TABLE_NAME AS Tabla_de_referencia,
        CU.COLUMN_NAME AS Columna_de_referencia,
        PK.TABLE_NAME AS Tabla_referenciada
    FROM
        INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC
        JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS FK
            ON RC.CONSTRAINT_NAME = FK.CONSTRAINT_NAME
        JOIN INFORMATION_SCHEMA.TABLE_CONSTRAINTS PK
            ON RC.UNIQUE_CONSTRAINT_NAME = PK.CONSTRAINT_NAME
        JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS CU
            ON CU.CONSTRAINT_NAME = RC.CONSTRAINT_NAME
    ORDER BY
        FK.TABLE_NAME,FK.CONSTRAINT_NAME,CU.COLUMN_NAME;
    """)
    relations = cursor.fetchall()
    print("\nRelaciones entre las tablas:")
    for relation in relations:
        fk_table_name = relation[0]
        fk_column_name = relation[1]
        pk_table_name = relation[2]
        # Imprimir mensaje descriptivo
        print(f"({fk_table_name}) -> referencia mediante '{fk_column_name}' a tabla -> ({pk_table_name})")
    
    print()
    
    
except Exception as ex:
    print("Error durante la conexión: {}".format(ex))

finally:
    connection.close()
    print()
    print("**CONEXIÓN CERRADA**")