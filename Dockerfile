# Step 1: Use an official Node.js runtime as a parent image
FROM node:18-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install --only=production

# Step 5: Copy the rest of your application's source code to the container
COPY . .

# Step 6: Build the application
RUN npm run build

# Step 7: Expose the port that the application will run on
EXPOSE 3000

# Step 8: Define the command to run your application
CMD ["npm", "run", "start:prod"]
