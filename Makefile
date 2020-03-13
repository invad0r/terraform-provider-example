.PHONY: clean

BINARY=terraform-provider-example

init:
	go mod init invad0r/${BINARY}

build:
	go build -o ${BINARY}

build-linux:
	$(shell env GOOS=linux GOARCH=amd64 go build -o ${BINARY})

clean:
	rm ./${BINARY}

docker-build:
	docker-compose -f docker-compose.yml build terraform

docker-run:
	docker-compose -f docker-compose.yml run terraform