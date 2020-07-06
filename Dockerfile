FROM python:3.7.3-stretch

ENV PYTHONUNBUFFERED=1
## Step 1:
# Create a working directory
WORKDIR /app

## Step 2:
# Copy source code to working directory
COPY . app.py /app/
## Step 3:
# Install packages from requirements.txt

RUN pip install pip==20.1.1 &&\
    pip install -r requirements.txt 
# 
## Step 4:
# Expose port 80

EXPOSE 80
## Step 5:
# Run app.py at container launch

CMD ["python3", "app.py"]
	