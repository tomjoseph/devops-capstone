#FROM python:3.7.3-stretch
FROM python:3.10-slim

# Create a working directory
WORKDIR /app

# Copy source code to working directory
COPY requirements.txt Makefile  /app/
COPY src /app/src

# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN make setup install

# Expose port 80
EXPOSE 80

# Run app.py at container launch
CMD ["python3", "src/app.py"]
