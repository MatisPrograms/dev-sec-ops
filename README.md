# dev-sec-ops

# DevOps Project

## Overview
This project is part of the EIEIN901 course on DevSecOps and Secure Web Development. It focuses on implementing DevOps practices to enhance the security and efficiency of web applications.

## Table of Contents
- [dev-sec-ops](#dev-sec-ops)
- [DevOps Project](#devops-project)
  - [Overview](#overview)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Installation](#installation)
  - [Usage](#usage)
  - [CircleCI](#circleci)
    - [Testing jobs locally](#testing-jobs-locally)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction
In this project, we explore various DevOps tools and methodologies to automate and secure the development lifecycle of web applications.

## Installation
To set up the project locally, follow these steps:
1. Clone the repository:
    ```sh
    git clone https://github.com/MatisPrograms/dev-sec-ops.git
    ```
2. Navigate to the project directory:
    ```sh
    cd dev-sec-ops
    ```
3. Run the Docker Compose command to build the project:
    ```sh
    docker-compose up --build
    ```
4. Access the web application in your browser at `http://localhost:8080`.

## Usage
You can create a `.env` file in the project root directory to configure the environment variables for the web application. Here is an example of the `.env` file: `.env.example`.

## CircleCI

### Testing jobs locally

To test the CircleCI jobs locally, you can use the CircleCI CLI. First, install the CLI by following the instructions in the [CircleCI CLI documentation](https://circleci.com/docs/2.0/local-cli/).
Once you have installed the CLI, you can run the following command to test the jobs locally:

```sh
circleci config process .circleci/config.yml > process.yml
circleci local execute -c process.yml $JOB_NAME
```

## Contributing
Contributions are welcome! Please fork the repository and create a pull request with your changes.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.