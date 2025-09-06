
FROM nikolaik/python-nodejs:python3.10-nodejs20

# System dependencies (ffmpeg)
RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements first (better for caching)
COPY requirements.txt .

# Install Python dependencies
RUN pip3 install --no-cache-dir -U -r requirements.txt

# Copy rest of the app
COPY . .

# Default command
CMD ["python3", "-m", "Hack"]
