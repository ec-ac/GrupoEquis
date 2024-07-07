<h2><strong>Explicación de Archivos:</strong></h2>

analisisEDAChinook.py --> código python del análisis exploratorio de la BD Chinook

creacSchemaChinook.py --> código python principal ETL

chinookCreateProd.sql --> sql script para crear el esquema de la BD Chinook

landingChinookCreateSchema.sql --> sql script para crear landing a partir de prod

Populate_ChinookProd.sql --> insert masivo de datos de tablas prod

CrearTodasLasVistas.sql --> sql script auxiliar de vistas modelo dimensional (no ejecutado en código python etl)

DimCustomer.sql --> sql script para crear vista de DimCustomer

DimEmployee.sql --> sql script para crear vista de DimEmployee

DimTrack.sql --> sql script para crear vista de DimTrack

FactMusicSale-sql --> sql script para crear vista de Fact Table

log_outputFile --> txt file en donde se loggean mensajes según ejecuciones de comandos

Grupo Equis - Foto Modeo Dimensional --> sketch físico de diseño de modelo dimensional

ChinookLandingGrupoX.bak --> DB backup file de Landing (con tablas, vistas, y datos)

ChinookProd.bak --> DB backupfile de Prod (con tablas y datos)
