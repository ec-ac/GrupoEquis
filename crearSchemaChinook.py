#ALMACEN DE DATOS - GRUPO EQUIS - GABRIEL CHANG Y ERNESTO ALANIZ - UAM
import pyodbc

nombre_servidor = '.' 
driver = 'ODBC Driver 17 for SQL Server'
schema_script_sql = 'stagingChinookCreateSchema.sql'
nombre_db = 'ChinookStagingGrupoX'

try:
    # Cadena de conexión con la instancia, utilizando driver de SQL Server, nombre del servidor, y método de autenticación (Windows)
    connection_string = f'DRIVER={{{driver}}};SERVER={nombre_servidor};Trusted_Connection=yes;'

    # Establecer la conexión a la instancia SQL (servidor)
    # mediante método "connect" de pyodbc, pasando como argumento la cadena de conexión
    connection = pyodbc.connect(connection_string, autocommit=True)
    
    print("Grupo Equis - Gabriel Chang y Ernesto Alaniz")
    print("*CONEXIÓN CON EL SERVIDOR EXITOSA*")
    
    # se crea un objeto cursor (asociado a la instancia de la conexión) para poder ejecutar comandos SQL 
    cursor = connection.cursor()

    # se crea la base de datos staging si no existe en el servidor
    # dicha sentencia se realiza aqui ya que pyodbc no permitió la creación/drop de bases de datos
    # dentro de un mismo script, a pesar de tener autocommit en True, y separar las transacciones-
    # (dentro de los errores, salía que no podía create/drop database en transacciones con-
    # múltiples instrucciones)
    cursor.execute(f"IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '{nombre_db}') "
                   f"CREATE DATABASE {nombre_db};")
    
    print("*La base de datos fue creada exitosamente, o ya existía*")
    
    # Leemos el archivo del script SQL que tenemos almacenado el mismo proyecto, que crea
    # el esquema de la base de datos ChinookStagingGrupoX (staging db), para luego mandarlo a llamar
    # con el método de pyodbc "execute" y ejecutarlo en la instancia SQL
    with open(schema_script_sql, 'r') as createSchema_file:
        createSchema_script = createSchema_file.read()
    
    # Ejecutar el script SQL, pasando al cadena de texto con el contenido del script, obtenido-
    # del método "read" del objeto file "createSchema_file" que lee del archivo sql en el proyecto
    cursor.execute(createSchema_script)    
    
    print("*Script de creación de esquema de la base de datos ejecutado exitosamente*")
    createSchema_file.close()
    cursor.close()

# manejo de excepciones en caso de algún error con la conexión, o ejecución de sentencias
except Exception as ex:
    print("Hubo un error durante la conexión o ejecución del script SQL. MENSAJE -->: {}".format(ex))

# cerrar la conexión
finally:
    connection.close()
    print("*CONEXIÓN CERRADA*")
