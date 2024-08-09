# Use Python 3.11 as the base image
FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the rest of the application files into the container
COPY . .

# Install required Python packages
RUN pip install -r requirements.txt

# Command to run the application
CMD [ "python", "main.py" ]