### Purpose
A alpine based aws and cli docker image

### Build
docker build -t xz-aws-ansible:1.0 .

### Run
docker run -it --rm -v ${PWD}:/var/app xz-aws-ansible:1.0 bash