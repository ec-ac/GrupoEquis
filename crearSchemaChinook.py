#ALMACEN DE DATOS - GRUPO EQUIS - GABRIEL CHANG Y ERNESTO ALANIZ - UAM
import pyodbc

nombre_servidor = 'localhost' 
driver = 'ODBC Driver 17 for SQL Server'
schema_script_sql = 'landingChinookCreateSchema.sql'
nombre_db = 'ChinookLandingGrupoX'
grupo_str = 'Grupo Equis - Gabriel Chang y Ernesto Alaniz\n'
con_success_str = "CONEXION CON EL SERVIDOR EXITOSA\n"
dbCreate_str = "La base de datos fue creada exitosamente, o ya existia\n"
scriptSuccess_str = "Script de creacion de esquema de la base de datos landing, y populates, ejecutado exitosamente\n"
close_con_str = "CONEXION CERRADA\n"

dim_customer_sql = 'DimCustomer.sql'
dim_customer_success = "Vista DimCustomer creada exitosamente\n"

dim_employee_sql = 'DimEmployee.sql'
dim_employee_success = "Vista DimEmployee creada exitosamente\n"

dim_track_sql = 'DimTrack.sql'
dim_track_success = "Vista DimTrack creada exitosamente\n"

fact_music_sale_sql = 'FactMusicSale.sql'
fact_music_sale_success = "Vista FactMusicSale creada exitosamente\n"


try:
    open('log_outputFile.txt', 'w').close()

    # Cadena de conexión con la instancia, utilizando driver de SQL Server, nombre del servidor, y método de autenticación (Windows)
    connection_string = f'DRIVER={{{driver}}};SERVER={nombre_servidor};Trusted_Connection=yes;'

    # Establecer la conexión a la instancia SQL (servidor)
    # mediante método "connect" de pyodbc, pasando como argumento la cadena de conexión
    connection = pyodbc.connect(connection_string, autocommit=True)
    
    print(grupo_str)
    print(con_success_str)

    
    with open("log_outputFile.txt", "a") as f:
        print(grupo_str, file=f)
        print(con_success_str, file=f)
    
    # se crea un objeto cursor (asociado a la instancia de la conexión) para poder ejecutar comandos SQL 
    cursor = connection.cursor()

    # se crea la base de datos landing si no existe en el servidor
    # dicha sentencia se realiza aqui ya que pyodbc no permitió la creación/drop de bases de datos
    # dentro de transacciones con multiples instrucciones, y pyodbc tampoco reconoce la sentencia
    # GO para separar instrucciones en un mismo script SQL
    # posteriormente se llamara un archivo sql que solo contiene la creación del esquema como tal, asumiendo
    # que ya la tiene
    cursor.execute(f"IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '{nombre_db}') "
                   f"CREATE DATABASE {nombre_db};")
    
    print(dbCreate_str)
    with open("log_outputFile.txt", "a") as f:
        print(dbCreate_str, file=f)
    
    # Leemos el archivo del script SQL que tenemos almacenado el mismo proyecto, que crea
    # el esquema de la base de datos ChinookLandingGrupoX (landing db), para luego mandarlo a llamar
    # con el método de pyodbc "execute" y ejecutarlo en la instancia SQL
    with open(schema_script_sql, 'r') as createSchema_file:
        createSchema_script = createSchema_file.read()
    
    # Ejecutar el script SQL, pasando al cadena de texto con el contenido del script, obtenido-
    # del método "read" del objeto file "createSchema_file" que lee del archivo sql en el proyecto
    cursor.execute(createSchema_script)    
    
    #imprimir que se pudo ejecutar el script de la creacionde la landing BD
    print(scriptSuccess_str)
    with open("log_outputFile.txt", "a") as f:
        print(scriptSuccess_str, file=f)

    # SCRIPTS DE CREACIÓN DE VISTAS

    # DimCustomer======================================================
    with open(dim_customer_sql, 'r') as createDimCustomer_file:
        createDimCustomer_script = createDimCustomer_file.read()
    cursor.execute(f"IF OBJECT_ID('DimCustomer', 'V') IS NOT NULL "
	            f"DROP VIEW [dbo].[DimCustomer]")

    cursor.execute(createDimCustomer_script)
    print(dim_customer_success)
    with open("log_outputFile.txt", "a") as f:
        print(dim_customer_success, file=f)

    # DimEmployee======================================================
    with open(dim_employee_sql, 'r') as createDimEmployee_file:
        createDimEmployee_script = createDimEmployee_file.read()
    cursor.execute(f"IF OBJECT_ID('DimEmployee', 'V') IS NOT NULL "
	            f"DROP VIEW [dbo].[DimEmployee]")

    cursor.execute(createDimEmployee_script)
    print(dim_employee_success)
    with open("log_outputFile.txt", "a") as f:
        print(dim_employee_success, file=f)

    # DimTrack======================================================
    with open(dim_track_sql, 'r') as createDimTrack_file:
        createDimTrack_script = createDimTrack_file.read()
    cursor.execute(f"IF OBJECT_ID('DimTrack', 'V') IS NOT NULL "
	            f"DROP VIEW [dbo].[DimTrack]")

    cursor.execute(createDimTrack_script)
    print(dim_track_success)
    with open("log_outputFile.txt", "a") as f:
        print(dim_track_success, file=f)

    # FactMusicSale======================================================
    with open(fact_music_sale_sql, 'r') as createFactSale_file:
        createFactSale_script = createFactSale_file.read()
    cursor.execute(f"IF OBJECT_ID('FactMusicSale', 'V') IS NOT NULL "
	            f"DROP VIEW [dbo].[FactMusicSale]")

    cursor.execute(createFactSale_script)
    print(fact_music_sale_success)
    with open("log_outputFile.txt", "a") as f:
        print(fact_music_sale_success, file=f)

    #cerrar files, y cursor
    createSchema_file.close()
    createDimCustomer_file.close()
    createDimEmployee_file.close()
    createDimTrack_file.close()
    createFactSale_file.close()
    cursor.close()

# manejo de excepciones en caso de algún error con la conexión, o ejecución de sentencias
except Exception as ex:
    exMsg_str = "Hubo un error durante la conexion o ejecución del script SQL. MENSAJE -->: {}".format(ex)

    print(exMsg_str)

    with open("log_outputFile.txt", "a") as f:
        print(exMsg_str, file=f)

# cerrar la conexión
finally:
    connection.close()
    print(close_con_str)
    with open("log_outputFile.txt", "a") as f:
        print(close_con_str, file=f)