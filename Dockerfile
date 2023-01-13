FROM ubuntu:20.04

# By default, listen on port 8081
EXPOSE 8081/tcp
ENV FLASK_PORT=8081

RUN apt-get install -y python python-pip

# Set the working directory in the container
WORKDIR /projects

# Copy the dependencies file to the working directory
COPY requirements.txt .

# Install any dependencies
RUN pip install -r requirements.txt

# Copy the content of the local src directory to the working directory
COPY . .

# Specify the command to run on container start
CMD [ "python", "./app.py" ]
