FROM python:3.9-slim-bullseye

#create virutal env and making it available in whole container
#this is not necessary coz containers are independent of the dependencies
ENV VIRTUAL_ENV=/opt/venv

#run is used while building the image
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# copy the application to the current directory
COPY app.py .

#run the application
#-host to allow incoming traffic or mention host='' in app.run
CMD [ "python3", "app.py", "--host=0.0.0.0"]