# Confluence

## Build

```
docker build -t confluence:5.7.1 --rm .
```

## Run

```
docker run -d --name postgres postgres
docker run -p 8090:8090 --name confluence --link postgres:db confluence:5.7.1
```
