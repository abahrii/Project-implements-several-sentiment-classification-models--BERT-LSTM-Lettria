FROM python:3.10-slim

# Environment variables to disable prompts and warnings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Installing system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Creating the working directory
WORKDIR /workspace

# Copying files into the Docker image
COPY . /workspace

# Installing Python dependencies
RUN pip install --upgrade pip
RUN pip install \
    torch \
    transformers \
    scikit-learn \
    pandas \
    numpy \
    pytorch-lightning \
    jupyterlab \
    matplotlib

# Set the default entry point
CMD ["python", "evaluate-sentiment-analysis-models.py"]