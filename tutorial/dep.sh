#!/bin/bash

clone(){
	echo "Cloning the repo"
	sudo git clone https://github.com/LondheShubham153/django-notes-app.git

}

requiredlib(){
	echo "Installing the dependencies"
	sudo apt-get install docker.io nginx -y docker-compose
}

restart(){
	sudo systemctl enable docker
	sudo systemctl enable nginx
}
deploy(){
	sudo docker build -t notes-app .
	#sudo docker run -d -p 8000:8000 notes-app:latest
	sudo docker-compose up -d
}

echo "^^^^^^^^^^^^^^^^^^Deploying^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
if ! clone ; then

	cd django-notes-app

fi	
if ! requiredlib ; then
	echo "installation fail"

	exit 1
fi

if ! restart ; then
	echo "System Fault"
	exit 1
fi

if ! deploy ; then 
	echo "deployement failed"
	exit 1
fi

echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^Done^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
