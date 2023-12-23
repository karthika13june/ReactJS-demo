sudo docker images
sudo docker build -t reactjs-demo-image .
docker run -p 3000:3000 reactjs-demo-image
