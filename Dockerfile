# Use official Python slim image
FROM python:3.9-slim

# Install system dependencies for OpenCV
RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Set working directory
WORKDIR /app

# Copy all project files
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port Railway will use
EXPOSE 8080

# Run the server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]
