# Use an official Ruby 3.1.2 runtime as a base image
FROM ruby:3.1.2

# Set working directory in the container
WORKDIR /app

# Update package sources and install necessary dependencies
RUN apt-get update -qq && apt-get install -y curl nodejs default-mysql-client

# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock /app/

# Install Ruby gems
RUN bundle install

# Copy application files into the container
COPY . /app/

# Expose port 3000
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]


