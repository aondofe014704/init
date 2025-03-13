# Use the official Node.js image for Windows as a base
FROM mcr.microsoft.com/windows/node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Expose the port that your app runs on
EXPOSE 8080

# Command to run your application
CMD ["node", "src/index.js"]
