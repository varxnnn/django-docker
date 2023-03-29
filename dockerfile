#########################################
#               Builder                 #
#########################################

#pull base image
FROM python:3.10.7 as builder

#set working directory
WORKDIR /usr/src

#ENV variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#Create Wheels of dependencies
RUN pip install --upgrade pip
COPY requirements.txt .
RUN pip wheel --no-cache-dir --no-deps --wheel-dir /usr/src/wheels -r requirements.txt

#########################################
#              Production               #
#########################################

#pull base image again
FROM python:3.10.7

#creating dir, user+group, home and stuff for APP USER
# RUN mkdir -p /home/apis
RUN mkdir -p -m777 /var/log/gunicorn
RUN adduser --system --group app                                
                #RUN addgroup -S app && adduser -S app -G app  
                #won't work to make user and group. this isn't the way to create user and 
                #group of same name in DEBIAN, which is the base image of our python base image.
# ENV HOME=/home/app
ENV APP_HOME=/home/kavach
RUN mkdir ${APP_HOME}

WORKDIR ${APP_HOME}

#Installing dependencies for user
COPY --from=builder /usr/src/wheels /wheels
COPY --from=builder /usr/src/requirements.txt .
RUN pip install --no-cache /wheels/*

#Copying project to workdir
COPY . ${APP_HOME}

#App user owns everything in their dir
RUN chown -R app:app ${APP_HOME}

#Changing user to APP
USER app