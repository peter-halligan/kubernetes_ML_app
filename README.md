# kubernetes_ML_app
Build status:
[![peter-halligan](https://circleci.com/gh/peter-halligan/kubernetes_ML_app.svg?style=svg)](https://app.circleci.com/pipelines/github/peter-halligan/kubernetes_ML_app)
Repo to build and a deploy an operationalised ML app

Flask based app to return house value predictions based on the boston housing data set.  
See more here about the dataset:  
https://www.kaggle.com/c/boston-housing


It will respond to a post request with a payload similar to, example can be found in make_prediction.sh:
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

1. clone this repo
2. `make setup`  
3. `source ~/.devops`
4. `run make install`
5. `make install-k8s` (optional to install minikube && kubectl)
6. `make lint`



### Docker 
To builds an image and d runs a contianer locally which can be queried on localhost:8000:  
```run_docker.sh <patch number> ``` 

Test local container by making a post request to localhost:8000:  
```make_prediction.sh```

Run the app in minikube:  
```run_kubernetes.sh <version number>``

example: ``./run_kubernetes.sh 0.1.33`

Run the application outside of a container:  
```python app.py```

### Building 

1. Change the name of the image/repo in upload_docker.sh
2. `export DOCKER_USERNAME=dockerhubusername`
3. `export DOCKER_PASSWORD=dockerhubpassword`
4. Build locally by running `run_docker.sh`
5. example: `./run_kubernetes.sh 0.1.33`



### circleci
Build in circle circleci  
https://circleci.com/docs/2.0/getting-started/#section=getting-started

1. Fork /clone repo  
2. Edit .circleci/config.yml and upload_docker.sh to use your dockerhub account user/repo  
3. Add your environmnet vars `DOCKER_USERNAME` `DOCKER_PASSWORD` to circleci  
4. Add repo to circleci to start building. 



