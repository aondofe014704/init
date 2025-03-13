FROM mcr.microsoft.com/windows/servercore:ltsc2022
RUN curl -o node-setup.msi https://nodejs.org/dist/v20.0.0/node-v20.0.0-x64.msi && msiexec /i node-setup.msi /quiet


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
