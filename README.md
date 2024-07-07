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

<h2><strong>Imágnes de Result Sets de datos relevantes del proceso de negocio:</strong></h2>

![64d1c05c-fecb-42c4-bf68-13cce150515e](https://github.com/ec-ac/GrupoEquis/assets/111550683/a020a1cb-c176-4a73-a139-287a02186808)
![10c3a27b-da99-4ef1-b7b8-7bd403dd7781](https://github.com/ec-ac/GrupoEquis/assets/111550683/99fe2038-b195-4bb2-b9d5-1d0e56f05f19)

