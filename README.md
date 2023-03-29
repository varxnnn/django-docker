**SEE END OF DOCKER-COMPOSE.YML FOR COMMANDS. RUN THE UP COMMAND WITH THE FLAGS, THEN ACCESS LOCALHOST:8888
if u want other devices to access it, make sure same network pe connected, private network
- access hosts ko ["*"] in settings.py
- cors error aaye toh make sure http pe chalo
- csrf error aaye toh csrf allow karne ka line hota which u add in settings.py, karlio**

both docker files are gucci
copy paste into your project, make sure you've docker installed and docker-compose installed as well
u hav windows, d-compose is installed with docker desktop, so it should be good.

if u make changes to src, need them to reflect in hosted container run
```
# docker-compose up -d --build                                            restarts containers with latest changes
```

all of the basic commands are in **docker-compose.yml**
baaki hmu obv ;)

