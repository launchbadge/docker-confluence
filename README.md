# Confluence

#### Build

```
docker build -t confluence:5.7.1 --rm https://github.com/launchbadge/docker-confluence.git
```

#### Run

```
docker run -v /data/postgres:/var/lib/postgresql/data --restart=always -d --name postgres postgres
docker run -v /data/confluence:/data --restart=always -d -p 8090:8090 --name confluence --link postgres:db confluence:5.7.1
```
