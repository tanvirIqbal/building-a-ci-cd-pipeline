#Clone the project
git clone git@github.com:tanvirIqbal/building-a-ci-cd-pipeline.git

# Go to the project folder
cd building-a-ci-cd-pipeline

#  Create a virtual environment
python3 -m venv ~/.myrepo

# Activate the virtual environment
source ~/.myrepo/bin/activate

# Install dependencies in the virtual environment and run tests
make all

# Start the application in the local environment
export FLASK_APP=app.py  
flask run  

# Open a separate Cloud Shell and test that the app is working
./make_prediction.sh

# Create an App Service in Azure. https://tanvir-udacity-webapp.azurewebsites.net
az group create -l westus -n udacity  
az webapp up -n tanvir-udacity-webapp -g -udacity

# After deploymnet, test the app running in Azure App Service
./make_predict_azure_app.sh 

# view the app log
az webapp log tail -g udacity --name tanvir-udacity-webapp
