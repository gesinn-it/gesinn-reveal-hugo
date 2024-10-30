# Use the Hugo extended version
FROM klakegg/hugo:ext-alpine

# Set the working directory to the volume mount
WORKDIR /src

# Copy files to a temporary directory if needed
COPY . /tmp/

# Expose the port Hugo uses
EXPOSE 1313

# Command to run the Hugo server
CMD ["hugo", "server", "--bind", "0.0.0.0", "--baseURL", "http://localhost:1313", "--port", "1313", "--watch"]
