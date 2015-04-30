build: cfg/* images/* Dockerfile start.sh
	docker build -t geard/pxe .

run: 	
	docker run -ti --net=host --privileged -v /home/chris/devroot/docker.Files/chris.Collection/pxe.Docker/cfg:/cfg -v /home/chris/devroot/docker.Files/chris.Collection/pxe.Docker/images:/images geard/pxe

