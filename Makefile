
all:
	make clean
	make build

clean:
	-docker image rm aunsbjerg/docker-kinetis-design-studio

build:
	docker build --squash -t aunsbjerg/docker-kinetis-design-studio .

.PHONY: all clean build