
FROM ubuntu:latest

# Install  packages
RUN apt update && apt install -y python3 python3-pip gunicorn

# Install Python dependencies
RUN pip install requests boto3 Flask

# Copy the application code to the container
COPY ./ /python3-final-project

# Set the working directory
WORKDIR /python3-final-project

# Expose the port your Flask app runs on
EXPOSE 8000

# Command to run the Flask application using Gunicorn
CMD ["gunicorn", "-w", "3", "--bind=0.0.0.0:8000", "application:app"]

