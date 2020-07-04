# kubernetes_ML_app
Build status:
[![phalligan](https://circleci.com/gh/phalligan/kubernetes_ML_app.svg?style=svg)](https://app.circleci.com/pipelines/github/peter-halligan/kubernetes_ML_app)
Repo to build and a deploy an operationalised ML app

flask app to return a house value prediction based on the boston housing data set.  
See more here about the dataset:  
https://www.kaggle.com/c/boston-housing


It will respond to a post request with a test payload:
```{  
   "CHAS":{  
      "0":0
   },
   "RM":{  
      "0":6.575
   },
   "TAX":{  
      "0":296.0
   },
   "PTRATIO":{  
      "0":15.3
   },
   "B":{  
      "0":396.9
   },
   "LSTAT":{  
      "0":4.98
   }
}
```

### setup env

clone this repo
`make setup`
`source ~/.devops`
`run make install`
`make install-k8s` (optional to install minikube && kubesctl)
`make lint`



### Docker 
To spin up a contianer locally which can be queried on localhost:8000:
```run_docker.sh <patch number> ``` builds and runs an image

test local container by making a post request to localhost:8000:
```make_prediction.sh```

run the app in minikube:
```run_kubernetes.sh <patch number>``

run the pplication outside of container:
```python app.py```

### Building 

the app can be built by running `run_docker.sh` you will need to change the name of the image/repo
the image can be pushed using `upload_docker.sh` again script will need to be changed
to upload the image your username and password should be set as an environment var
`export DOCKER_USERNAME=dockerhubusername`
`export DOCKER_PASSWORD=dockerhubpassword`


### circleci
to build in circle circleci

fork /clone repo
edit .circleci/config.yml and upload_docker.sh to use your dockerhub account user/repo
add your environmnet vars DOCKER_USERNAME DOCKER_PASSWORD to circleci
Add repo to circli to start building.

https://circleci.com/docs/2.0/getting-started/#section=getting-started



