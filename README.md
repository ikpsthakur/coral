# Pi5 <> Google Coral USB

Google Coral USB on Raspberry pi 5 using Docker

It's important to use Debian 10, as that version still has a system Python version old enough to work with the Coral Python libraries.

Build the Docker image, and tag it coral: {you can also the script ./build.sh}

  sudo docker build -t "coral" .

Run the Docker image and test the TPU

Make sure the device /dev/bus/usb is appearing on your system, then use the following docker run command to pass that device into the container:

  docker container run -dit --privileged -v /dev/bus/usb:/dev/bus/usb --name mycoral coral /bin/bash

You can then connect into the container using

  docker container exec -it mycoral /bin/bash

You can start and stop the container using

  docker container stop mycoral 
  or
  docker container start mycoral

You can check the container status using standard commands as

  docker container ls -a

