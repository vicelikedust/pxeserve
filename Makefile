build: cfg/* images/* Dockerfile start.sh
	docker build -t geard/pxe .

run: 	
	docker run -ti --net=host --privileged -v cfg:/cfg -v images:/images geard/pxe

