#ALMACEN DE DATOS - GRUPO EQUIS - GABRIEL CHANG Y ERNESTO ALANIZ - UAM
import pyodbc

nombre_servidor = 'localhost' 
driver = 'ODBC Driver 17 for SQL Server'
schema_script_sql = 'stagingChinookCreateSchema.sql'
nombre_db = 'ChinookStagingGrupoX'
grupo_str = 'Grupo Equis - Gabriel Chang y Ernesto Alaniz\n'
con_success_str = "CONEXIÓN CON EL SERVIDOR EXITOSA\n"
dbCreate_str = "La base de datos fue creada exitosamente, o ya existía\n"
scriptSuccess_str = "Script de creación de esquema de la base de datos ejecutado exitosamente\n"
close_con_str = "CONEXIÓN CERRADA\n"

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

    # se crea la base de datos staging si no existe en el servidor
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
    # el esquema de la base de datos ChinookStagingGrupoX (staging db), para luego mandarlo a llamar
    # con el método de pyodbc "execute" y ejecutarlo en la instancia SQL
    with open(schema_script_sql, 'r') as createSchema_file:
        createSchema_script = createSchema_file.read()
    
    # Ejecutar el script SQL, pasando al cadena de texto con el contenido del script, obtenido-
    # del método "read" del objeto file "createSchema_file" que lee del archivo sql en el proyecto
    cursor.execute(createSchema_script)    
    
    print(scriptSuccess_str)
    with open("log_outputFile.txt", "a") as f:
        print(scriptSuccess_str, file=f)
    createSchema_file.close()
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