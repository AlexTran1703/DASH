#Get Ubuntu image base

FROM ubuntu:latest as server-image

#Label of the images

LABEL description="server"

#Update and install g++ on base image
RUN apt-get -y update && apt-get install -y build-essential
RUN apt-get upgrade -y
RUN apt-get install -y libmysqlclient-dev  
#Copy folder of souce code server to Docker images
COPY ./server /server
COPY ./database /database

#Working directory
WORKDIR /server

#compile source with C++
RUN g++ server.cpp -o server -lmysqlclient

#Run the application
# CMD ["tail", "-f" ,"/dev/null"]
CMD ["./server"]
