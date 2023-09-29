# Use an official Ruby runtime as a parent image
FROM ruby:2.7

# Set the working directory to /app
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install bundle and gem dependencies
RUN gem install bundler && bundle install

# Copy the rest of the project files into the container
COPY . .

# Make the script executable (if it's not already)
RUN chmod +x fetch.rb

# Run the script when the container launches
CMD ["./fetch.rb"]