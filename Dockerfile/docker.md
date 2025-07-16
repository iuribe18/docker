## Partes más importantes de un Dockerfile

| Instrucción    | Propósito                                                                |
| -------------- | ------------------------------------------------------------------------ |
| `FROM`         | Define la imagen base (ej: `python:3.12-slim`)                           |
| `WORKDIR`      | Establece el directorio de trabajo dentro del contenedor                 |
| `COPY` / `ADD` | Copia archivos desde el host hacia el contenedor                         |
| `RUN`          | Ejecuta comandos en tiempo de construcción (ej: `apt install`, `pip`)    |
| `ENV`          | Define variables de entorno                                              |
| `EXPOSE`       | Documenta el puerto que escucha la app (no lo expone en el host)         |
| `ENTRYPOINT`   | Define el ejecutable principal (comportamiento fijo)                     |
| `CMD`          | Define los argumentos por defecto para el `ENTRYPOINT` o comando default |

