.PHONY: install lint test build run scan

install:          ## install dev dependencies
	pip install -r requirements-dev.txt

lint:             ## lint Python code
	ruff check .

test:             ## run unit tests
	pytest -q

build:            ## build the container image
	docker build -t devsecops-demo:local .

run: build        ## run the container on port 8000
	docker run --rm -p 8000:8000 devsecops-demo:local

scan: build       ## scan the image locally with Trivy (needs trivy installed)
	trivy image --severity HIGH,CRITICAL --ignore-unfixed devsecops-demo:local
