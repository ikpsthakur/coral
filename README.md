# Pi5 & Google Coral USB

<p align="center">
  <img width="800" src="https://images.ctfassets.net/2lpsze4g694w/5XK2dV0w55U0TefijPli1H/bf0d119d77faef9a5d2cc0dad2aa4b42/Edge-TPU-USB-Accelerator-and-Pi.jpg?w=800" alt="Raspberry Pi single board computer with USB Edge TPU accelerator">
</p>

## Google Coral USB on Raspberry pi 5 using Docker

> It's important to use Debian 10, as that version still has a system Python version old enough to work with the Coral Python libraries.

Build the Docker image, and tag it `coral`:
```
  sudo docker build -t "coral" .
```
>[!TIP]
> you can also use the script `./build.sh`

Run the Docker image and test the TPU

Make sure the device `/dev/bus/usb` is appearing on your system, then use the following `docker run` command to pass that device into the container:
```
  docker container run -dit --privileged -v /dev/bus/usb:/dev/bus/usb --name mycoral coral /bin/bash
```

You can then connect into the container using
```
  docker container exec -it mycoral /bin/bash
```
You can start and stop the container `mycoral` using
```
  docker container stop mycoral
``` 

```
  docker container start mycoral
```

You can check the container status using standard commands as
```
  docker container ls -a
```
