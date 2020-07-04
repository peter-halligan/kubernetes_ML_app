# kubernetes_ML_app
Repo to build and a deploy an operationalised ML app

flask app to return a house value prediction based on the boston housing data set.

### Docker 
To spin up a contianer locally which can be queried on localhost:8000:
```run_docker.sh <patch number> ``` builds and runs an image

test local container by making a post request to localhost:8000:
```make_prediction.sh```

run the app in minikube:
```run_kubernetes.sh <patch number>``


### setup env

clone this repo
`make setup`
`source ~/.devops`
`run make install`
`make install-k8s` (optional to install minikube && kubesctl)
`make lint`

### Building 

the app can be built by running `run_docker.sh` you will need to change the name of the image/repo
the image can be pushed using `upload_docker.sh` again script will need to be changed
to upload the image your username and password should be set as an environment var
`export DOCKER_USERNAME=dockerhubusername`
`export DOCKER_PASSWORD=dockerhubpassword`


### circleci
to build in circle circleci

fork /clone repo
edit config.yml an upload_docker.sh to use your dockerhub user/repo
add your environmnet vars DOCKER_USERNAME DOCKER_PASSWORD to circleci
