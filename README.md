# Lab 3 — Introduction to APIs

**Course:** Software Defined Networking  
**Module:** Network Automation Fundamentals • **Lab #:** 3  
**Estimated Time:** 1.5–2 hours

## Repository structure

```text
Lab-3-Introduction-to-APIs
├── .devcontainer
│   └── devcontainer.json
├── .gitignore
├── .markdownlint.json
├── .markdownlintignore
├── .pettierrc.yml
├── INSTRUCTIONS.backup.md
├── INSTRUCTIONS.md
├── LICENSE
├── README.backup.md
├── README.md
├── data
│   └── inventory.example.yml
├── lab.yml
├── prettierrc.yml
├── requirements.txt
├── src
│   ├── __init__.py
│   └── main.py
└── tools
    └── logcurl.sh
```


## Lab Topics

### Getting Started with cURL
cURL is a command-line tool for making HTTP requests. It supports various protocols and is  widely used for testing APIs. cURL commands typically include the URL, method, headers, and data. You can install cURL on most systems via package managers like `apt`, `brew`, or `choco`. To check  if cURL is installed, run `curl --version` in your terminal.


```bash
curl --version

```

### cURL Basics
The basic syntax for a cURL command is: ``` curl [options] <URL> ``` Common options include: - `-X <METHOD>`: Specify the HTTP method (GET, POST, etc.). - `-H "<HEADER>"`: Add a header to the request. - `-d "<DATA>"`: Include data in the request body (for POST/PUT). - `-o <FILE>`: Save the response to a file. - `-v`: Enable verbose output to see request/response details.
You can combine these options to customize your requests. For example, to make a GET request with a custom header: `curl -H "Authorization: Bearer <token>" https://api.example.com/data`. This command includes an authorization header  with a bearer token which we can use to authentcate to our API. We can also request JSON data by adding an `Accept` header to our request as shown below:


```bash
curl -H "Authorization: Bearer <token>" -H "Accept: application/json" https://api.example.com/data

```

### Understanding HTTP Methods
HTTP methods define the action to be performed on a resource. The most common methods are: - `GET`: Retrieve data from a server. - `POST`: Send data to a server to create a resource. - `PUT`: Update an existing resource on the server. - `DELETE`: Remove a resource from the server.
Each method has specific semantics and is used in different scenarios. For example, use `GET` for fetching data,  and `POST` for submitting forms or uploading files. This is known as a CRUD operation (Create, Read, Update, Delete). While not every api supports all methods, most will support at least GET and POST.


### Disecting HTTP Response Codes
HTTP response codes indicate the result of an HTTP request. They are grouped into five categories: - `1xx`: Informational responses (e.g., 100 Continue) - `2xx`: Successful responses (e.g., 200 OK, 201 Created) - `3xx`: Redirection messages (e.g., 301 Moved Permanently, 302 Found) - `4xx`: Client error responses (e.g., 400 Bad Request, 401 Unauthorized, 404 Not Found) - `5xx`: Server error responses (e.g., 500 Internal Server Error, 503 Service Unavailable)
Understanding these codes helps diagnose issues with API requests. For example, a `401 Unauthorized` indicates  that authentication is required or has failed, while a `404 Not Found` means the requested resource does not exist. A 200 status code indicates that the request was successful and the server returned the requested data.


### JSON Responses
JSON (JavaScript Object Notation) is a lightweight data interchange format that is easy for humans to read and write,  and easy for machines to parse and generate. Many APIs use JSON to format their responses because it is language-independent  and widely supported.
You can use tools like `jq` to parse and pretty-print JSON responses in the terminal. For example, to extract the `name` field  from a JSON response, you can use the example command below:


```bash
curl -H "Accept: application/json" https://api.example.com/data | jq '.name'

```

### Postman Overview
Postman is a popular API client that provides a user-friendly interface for building, testing, and documenting APIs. It allows you  to create and save requests, organize them into collections, and share them with others. Postman supports various authentication methods, including API keys, OAuth, and bearer tokens. You can also use Postman to generate code snippets in multiple programming languages, making it easier to integrate API calls into your applications. Postman is available as a desktop application and a web app. You can download it from the [Postman website](https://www.postman.com/) or use it directly in your browser.


### Postman Features
Key features of Postman include: - **Collections**: Organize requests into collections for better management. - **Environments**: Use environments to store variables like API keys and URLs for different setups (development, staging, production). - **Pre-request Scripts**: Write JavaScript code to execute before a request is sent, useful for setting dynamic variables. - **Tests**: Write tests to validate responses and automate testing workflows. - **Mock Servers**: Create mock servers to simulate API responses for testing purposes.
Postman also provides collaboration features, allowing teams to work together on API development and testing.


### Working with Publi APIs
Public APIs are APIs that are available for use by anyone. They often require an API key or token for authentication, but some may be open and free to use without any credentials. When working with public APIs, it is important to read the documentation to understand the available endpoints, request parameters, and response formats. Many public APIs have rate limits to prevent abuse, so be mindful of how many requests you make in a given time period.
Examples of popular public APIs include the [Dad Jokes API](https://icanhazdadjoke.com/api) for fetching random dad jokes and the [Deck of Cards API](https://deckofcardsapi.com/) for simulating a deck of playing cards.
The Dad Jokes API requires the `Accept: application/json` header to return JSON responses, while the Deck of Cards API allows you  to create a new deck and draw cards using the same `deck_id`. Use the `deck_id` from the create response to draw cards in subsequent requests.


### Authentication Methods
Authentication is the process of verifying the identity of a user or application before granting access to an API. Common authentication methods include: - **API Keys**: A simple token that is included in the request header or URL to identify the client. - **Bearer Tokens**: A type of token that is included in the `Authorization` header as `Bearer <token>`. It is often used with OAuth 2.0. - **OAuth**: A more complex authentication framework that allows users to grant third-party applications access to their resources without sharing credentials.
When making authenticated requests, ensure that you include the necessary headers and tokens as specified in the API documentation. If authentication fails, you may receive a `401 Unauthorized` response. For this module our APIs do not require any authentication, but moving on to Cisco DevNet APIs and other enterprise APIs you will need to authenticate.




## License
© 2025 Your Name — Classroom use.
