# Web Page Fetcher

Web Page Fetcher is a command-line program that fetches web pages and saves them to disk for later retrieval and browsing. It also provides metadata about the fetched web pages.

## Prerequisites

Before you can run this application, make sure you have the following prerequisites installed on your system:

- [Docker](https://www.docker.com/get-started)

## Getting Started

Follow these steps to run the Web Page Fetcher using Docker:

1. Clone this GitHub repository to your local machine:

   ```bash
   git clone https://github.com/alldiezzz/download-html.git
   ```

2. Change your working directory to the repository folder:

  ```bash
  cd download-html
  ```

3. Build the Docker image for the application (replace <image_name> with your desired image name):
  ```bash
  docker build -t <image_name> .
  ```
4. Run the Docker container:
  - To fetch a web page, use the following command (replace <url> with the URL of the web page you want to fetch):
  ```bash
  docker run --rm -v "$(pwd)":/app -w /app <image_name> ./fetch.rb <url>
  ```
  - To fetch a web page and get metadata, use the following command (replace <url> with the URL of the web page you want to fetch):
  ```bash
  docker run --rm -v "$(pwd)":/app -w /app <image_name> ./fetch.rb --metadata <url>
  ```
5. Without docker container
  - go to folder repository
  - run bundle install
  - To fetch a web page, use the following command (replace <url> with the URL of the web page you want to fetch):
  ```bash
  ./fetch <url>
  ```
  - To fetch web page and get metadata, use the following command (replace <url> with the URL of the web page you want to fetch):
  ```bash
  ./fetch --metadata <url>
  ```
6. You can find all the downloaded web page inside downloads folder

##Example

# With Docker
  - only fetch web page
  ```bash
  docker run --rm -v "$(pwd)":/app -w /app fetch-page ./fetch.rb https://www.google.com
  ```

  - fetch web page with metadata
  ```bash
  docker run --rm -v "$(pwd)":/app -w /app fetch-page ./fetch.rb --metadata https://www.google.com 
  ```
# Without Docker
  - only fetch web page
  ```bash
  ./fetch https://www.google.com
  ```

  - fetch web page with metadata
  ```bash
  ./fetch --metadata https://www.google.com
  ```
