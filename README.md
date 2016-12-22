# docker-mediacccde
docker container for media.ccc.de rails application
## usage
```
# Start Database Container
docker run --name mediadb -e POSTGRES_PASSWORD=mysecretpassword -d postgres

# Create media user in postgres 
# set password of the new user(voctoweb) to "voctoweb"
# when prompted for a password use the one from the first docker command (e.g. mysecretpassword)
docker run --rm -it --link mediadb:dbhost postgres createuser -d -P voctoweb -h dbhost -W -U postgres 

# Start Application Container
docker run --rm -it --link mediadb:dbhost -p 3000:3000 bjoernr/mediacccde
```
open a browser to http://localhost:3000/
