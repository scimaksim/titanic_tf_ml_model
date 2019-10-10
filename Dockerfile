FROM fedora:28
 
# File Author / Maintainer
MAINTAINER Sven Boesiger <donotspam@ujelang.com>
 
# Update the sources
RUN dnf -y update --refresh
 
# Install additional dependencies
RUN dnf -y install libstdc++
 
RUN dnf -y autoremove
 
# Copy the application folder inside the container
ADD /titanic_tf_ml_model /titanic_tf_ml_model
 
# Get pip to download and install requirements:
RUN pip3 install -r /titanic_tf_ml_model/requirements.txt
 
# Expose ports
EXPOSE 5000
 
# Set the default directory where CMD will execute
WORKDIR /titanic_tf_ml_model
 
# Set the default command to execute   
# when creating a new container
CMD python3 server.py
