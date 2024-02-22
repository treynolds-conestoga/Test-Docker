# Start form Python base file 3.9
FROM python:3.11

# Set wdir to code folder
WORKDIR /code

# Copy requirements
COPY ./requirements.txt /code/requirements.txt

# Install the requirements but does not save the packages locally
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# copy app file over
COPY ./app /code/app

# Run the app
CMD ["uvicorn", "app.main:app", "--proxy-headers", "--host", "0.0.0.0", "--port", "80"]