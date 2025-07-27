# install python --> base layer
FROM python:3.10

# set our workdir
WORKDIR /app/

# copy the files
COPY ./flask_app/ .

# install packages
RUN pip install --no-cache-dir -r requirements.txt

# install nltk related packages
RUN python -m nltk.downloader stopwords wordnet

# add env variables
ENV PORT=5000

# copy the model and vectorizer files
COPY ./models/ ./models/

# expose port for the flask app
EXPOSE 5000

# final cmd statement --> run the container
CMD [ "python", "app.py"]