#!/bin/bash

#clone the repository
git clone https://github.com/rvsp/reactjs-demo.git

#navigate to the project directory
cd reactjs-demo

#create Dockerfile
echo"
FROM node:14
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80
CMD [ "npm" ,"start"] 
" > Dockerfile

#Build the docker image
sudo docker build -t reactjs-demo-image .

#Tag the Docker image
sudo docker tag reactjs-demo-image nivedha02/prod
sudo docker tag reactjs-demo-image nivedha02/dev

#login to docker Hub
sudo docker login

#push the docker image to the docker hub 
sudo docker push nivedha02/dev
sudo docker push nivedha02/prod
