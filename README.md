# Introduction
This is my submission for the 'Building a CI/CD Pipeline' project as part of the 'Cloud DevOps using Microsoft Azure' nanodegree program from [Udacity](https://udacity.com).

This project contains a python application that is designed to predict housing prices in Boston (the app is not developed by me). This repo will enable you to:
- Deploy the app in Azure CloudShell
- Deploy the app as an Azure App Service

Any commits to the GitHub repo trigger automated code testing using GitHub Actions. A pipeline has been created in Azure DevOps, and the updated code is also automatically tested in Azure DevOps and deployed to the Azure App Service. 

Here is an architectural diagram:
![architectural-diagram.png](ScreenShot/8.%20Architecture.png)

A [Trello](https://trello.com/b/U1veFxKH/building-ci-cd-pipeline) board has been created to keep track of tasks to be completed.

A [spreadsheet](project-management.xlsx) has been created to manage the project schedule.

See [here](https://www.youtube.com/) for a YouTube video demonstrating the project.

# Instructions

## Deploy the app in Azure Cloud Shell
In Azure Cloud Shell, clone the repo:
```
git@github.com:tanvirIqbal/building-a-ci-cd-pipeline.git
```
![screenshot-git_clone.png](ScreenShot/1.%20Cloning%20project%20into%20Azure%20Cloud%20Shell.png) 

Change into the new directory:
```
cd building-a-ci-cd-pipeline
```

Create a virtual environment:
```
python3 -m venv ~/.myrepo
```

Activate the virtual environment:
```
source ~/.myrepo/bin/activate
```

Install dependencies in the virtual environment and run tests:
```
make all
```
![screenshot-make_all.png](ScreenShot/2.%20Make%20all.png) 

Start the application in the local environment:
```
export FLASK_APP=app.py  
flask run  
```

Open a separate Cloud Shell and test that the app is working:
```
./make_prediction.sh
```

The output should match the below:

![screenshot-make_prediction.png](ScreenShot/4.%20Prediction.png)





## Deploy the app to an Azure App Service

Create an App Service in Azure. In this example the App Service is called rob-udacity-webapp and the resource group is called rob-udacity-project:
```
az group create -l westus -n udacity  
az webapp up -n tanvir-udacity-webapp -g -udacity
```

Next, create the pipeline in Azure DevOps. More information on this process can be found [here](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops&WT.mc_id=udacity_learn-wwl). The basic steps to set up the pipeline are:

- Go to [https://dev.azure.com](https://dev.azure.com) and sign in.
- Create a new private project.
- Under Project Settings create a new service connection to Azure Resource Manager, scoped to your subscription and resource group.
- Create a new pipeline linked to your GitHub repo.

Screenshot of the App Service in Azure:

![screenshot-app_service.png](ScreenShot/6.%20Web%20App.png)

Screenshot of a successful run of the project in Azure Pipelines:

![screenshot-azure_pipeline_success.png](ScreenShot/7.%20Azure%20Pipeline.png)

To test the app running in Azure App Service, edit line 28 of the make_predict_azure_app.sh script with the DNS name of your app. Then run the script:
```
./make_predict_azure_app.sh 
```

If it's working you should see the following output:

![screenshot-make_predict_azure_app.png](ScreenShot/5.%20Prediction%20Azure.png)

You can also visit the [URL](https://tanvir-udacity-webapp.azurewebsites.net/) of the App Service via the browser.
