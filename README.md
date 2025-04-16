# Au-ó Backend Repository

# Szükséges:

- [jdk 17](https://www.oracle.com/java/technologies/javase/jdk17-archive-downloads.html)

- [Docker Hub](https://hub.docker.com/)

- Docker image: [postgres:17.2-alpine3.21](https://github.com/docker-library/postgres/blob/17818f21dca10ccf02711476e138c219bd31b456/17/alpine3.21/Dockerfile)

> Docker beállítások
> 
> port: 32769
> 
> Enviroment variables?
> 
> POSTGRES_USER : postgres
> 
> POSTGRES_PASSWORD : password



## 🚮 Database Dump
Ebben a GitHub repóban, [ITT](https://github.com/bnolod/au-o_backend/blob/main/projectdump.sql) található.

[Adatbázis-modell (tervezett és végleges)](https://www.figma.com/design/ZMLoquJGEDi3lEhLdslQ9c/DB?node-id=0-1&t=TieU6GhKptEArDWm-1)

# API

Az api manuális tesztelése [Postman](https://www.postman.com/)-en keresztül történik.
A collection [itt](https://github.com/bnolod/au-o_backend/blob/main/Au_o%20backend.postman_collection.json) található meg.


## Swagger API dokumentáció
```
http://localhost:8080/swagger-ui/index.html#/
```
URL-en elérhető, szerver futása közben.


# Tesztelés

- Automatizált egységtesztek
  - `src/test`
  - 100% pass
- API tesztek
  - manuális tesztek
  - generált tesztek
    - Az automatikusan legenerált teszteseteket az előre megírt Postman kollekcióból generáltuk egy eszköz segítségével. 
    - A generált tesztek pass arányai különbözhetnek az adatbázis állapotától függően.
