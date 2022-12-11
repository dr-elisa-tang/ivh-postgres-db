# ivh-database
InnoVet Health Database

## Build Database
```
docker build -t ivh-database .
```
## Run Database
```
docker run -d --name ivh-database -p 5432:5432 ivh-database
```