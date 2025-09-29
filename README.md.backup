# Lab 3 Introduction to APIs

## :triangular_flag_on_post: Learning Goals
- Explain what an API is (Application Programming Interface) and why HTTP APIs are the “universal remote” for modern software and networking
- Describe the parts of an HTTP request/response: URL, method (GET/POST/PUT/DELETE), headers, body, status code
- Recognize the difference between human web browsing and programmatic API use (browser vs tool vs script)
- Utilize cURL to send basic GET requests to a public API
- Pass simple authentication to a secure API with cURL
- Utilize Postman to build a request and compare the request response visually
- Save a collection of requests as a Postman collection

## :globe_with_meridians: Overview:

In this lab, you’ll be introduced to the fundamentals of working with web-based APIs, a cornerstone skill in modern network automation. You’ll learn how to send and inspect requests using both cURL (a command-line tool) and Postman (a graphical client), comparing how each one interacts with an API. Along the way, you’ll explore the basic building blocks of the HTTP protocol—methods, headers, status codes, and JSON responses—and practice retrieving data from a live API. By the end, you’ll understand not just how to make requests, but also how to read and interpret the responses that power automation workflows.

### Getting Started with cURL
cURL is a command-line tool that lets you interact directly with web servers and APIs. Instead of using a browser, which hides the details, cURL shows you exactly what happens when a request is made. The name stands for *“Client URL”*, and it’s built into most Linux distributions (including WSL) and available on Windows and macOS. At its simplest, you can type `curl <URL>` to fetch the contents of a web page or call an API. For example, `curl https://api.github.com` will send a basic HTTP GET request and return a response in the terminal.

In this lab, we’ll use cURL to practice making API requests so you can see how data is requested, delivered, and displayed. You’ll learn how to add options such as `-v` for verbose output (to see headers and status codes) and `-H` to include headers like Accept: application/json. These small additions transform cURL from a simple downloader into a powerful way to explore and debug APIs, helping you understand exactly what’s happening under the hood when a program talks to a web service.

### cURL Basics
To get comfortable with cURL, we’ll start with the [Dad Jokes API](https://icanhazdadjoke.com/api)
, a simple and fun service that returns random jokes. By default, if you run `curl https://icanhazdadjoke.com/`, the response will be plain text. However, most APIs return data in JSON (JavaScript Object Notation), so we’ll add a header telling the server we want JSON instead:

```bash

curl -H "Accept: application/json" https://icanhazdadjoke.com/

```

This command demonstrates the core of API interaction: you send a request with the method (GET here), a target URL, and sometimes extra information like headers or query parameters. The server responds with structured data you can parse, search, or use in code.

Working with the Dad Jokes API shows you how small changes in your cURL command affect the response. You’ll practice experimenting with headers, using `-v` to see status codes, and observing the raw JSON returned. These basics build the foundation for calling more complex APIs later in the lab.

### Understanding HTTP Methods

APIs don’t just serve information — they also let you create, update, and delete data. To control this, they use HTTP methods, which are like verbs telling the server what action you want to perform. The four most common methods map directly to the idea of CRUD operations (Create, Read, Update, Delete):

- GET → Read: retrieves information without changing anything. Example: asking for today’s Dad Joke.

- POST → Create: sends new data to the server. Example: adding a new entry to a database.

- PUT/PATCH → Update: modifies existing data. PUT usually replaces the whole record, while PATCH changes just part of it.

- DELETE → Delete: removes data from the server.

While not every API supports all four methods, this CRUD pattern is a foundation for understanding how web services are designed. In this lab, you’ll mostly use `GET` to request information, but it’s important to see where the other methods fit so you can recognize them later in more complex network automation workflows.

### Understanding HTTP Responses and JSON
Every time you make a request with cURL, the server answers with two key pieces: an HTTP response and a body. The response includes a status code, like `200 OK` (success), `404 Not Found` (the URL doesn’t exist), or `401 Unauthorized` (you need credentials). These codes are your first hint about whether the request worked as expected. You can reveal them by adding the `-v` (verbose) flag to your cURL command, which also shows you headers—metadata that describes the response, such as its format or length.

Most modern APIs send the body of the response in JSON, a lightweight text format that looks like nested key–value pairs. For example, a Dad Jokes response might include something like:

```json

{"id": "abc123", "joke": "I'm reading a book about anti-gravity. It's impossible to put down!", "status": 200}

```

Here you can see fields (`id`, `joke`, `status`) and their values. JSON is easy for humans to read and for programs to parse, which is why it has become the standard format for APIs. Understanding how to interpret these responses—status codes, headers, and JSON data—is essential before moving on to more advanced tools like Postman.

### Introduction to Postman
Postman is a graphical tool that makes working with APIs more approachable, especially when you’re just starting out. Instead of typing long cURL commands into the terminal, Postman gives you a workspace where you can build requests step by step, send them with a click, and see the results neatly formatted. The interface separates the pieces of a request—method, URL, headers, body—so you can clearly see what’s being sent. When the server responds, Postman displays the status code, headers, and body in an organized view, which is much easier to read than raw terminal output.

### Comparing cURL and Postman
One of Postman’s strengths is the ability to save and organize your requests into collections. This means you can build a set of API calls (like different steps in a workflow), label them, and reuse them later without retyping. Postman also makes it simple to experiment: you can toggle headers, add authentication tokens, or switch from `GET` to `POST` with dropdown menus. In this lab, you’ll recreate some of the same requests you practiced with cURL, letting you see how Postman and cURL are simply different front ends to the same underlying protocol.

### Working with the Deck of Cards API
The Deck of Cards API is a playful way to practice making more complex API calls. Instead of just retrieving a joke or a simple piece of text, this API lets you simulate shuffling and dealing cards from a virtual deck. To start, you’ll make a `GET` request to create a new shuffled deck, which returns a JSON object containing a unique `deck_id`. That `deck_id` is like your session—it keeps track of the deck you’re using. Once you have it, you can send another request to “draw” one or more cards, and the API will respond with details such as the card’s value, suit, and even an image URL.

In this section, you’ll build these requests with both cURL and Postman. With cURL, you’ll chain together multiple requests, watching how the `deck_id` moves from one command to the next. With Postman, you’ll see how storing variables makes it easier to reuse values like the `deck_id` across requests. By the end, you’ll have drawn a card from your own shuffled deck using two different tools, reinforcing that while the interfaces are different, the underlying API principles are the same.

### Authenticating to Secure APIs
So far, the APIs you’ve used have been open and didn’t require any credentials. In the real world, most APIs are secured, meaning you must prove who you are before the server will respond. This process is called authentication, and it ensures that only authorized users or applications can access the data or perform actions. The most common methods you’ll encounter are:

- API Keys: a unique string (like a password) that you include in your request, often as a header or query parameter.

- Bearer Tokens: a more secure form of key, usually passed in the `Authorization` header (e.g., `Authorization: Bearer <token>`).

- Basic Authentication: a username and password encoded together and sent with the request (less common today for APIs).

In practice, authenticating with cURL or Postman just means adding the correct header or credential to your request. For example, you might use `-H "Authorization: Bearer <token>"` with cURL, or add the same token in Postman’s Authorization tab. This lab won’t require you to sign up for keys, but understanding the concept now prepares you for real APIs where secure access is the norm.

---

## :card_file_box: File Structure:

'''
file structure
'''

---

## Components
text

### 1. **Component 1**
text

### 2. **Component 2**
text

### 3. **Component 3**
text

## :memo: Instructions
1. Install and Verify cURL (ensure it runs from your terminal)
2. Make Your First cURL Request to Dad Jokes API and redirect the output to <>
3. Explore the Dad Jokes API with cURL
    - Request plain text response
    - Request JSON response with headers
    - Enable verbose mode to inspect status codes and headers
4. Understand HTTP Methods
    - Compare GET, POST, PUT/PATCH, DELETE in documentation examples
    - Identify how they map to CRUD operations
5. Examine HTTP Responses and JSON
    - Identify status codes from cURL output
    - Locate keys and values in JSON responses
6. Authenticate to a Secure API
    - Add a header with an API key or bearer token (demo example)
    - Observe the difference between authenticated vs unauthenticated requests
7. Install and Launch Postman
    - Create a new request tab
    - Reproduce the Dad Jokes API call in Postman
    - Compare the Postman response viewer with cURL output
8. Compare cURL and Postman Workflows
    - Export a Postman request as cURL
    - Note advantages of each tool
9. Work with the Deck of Cards API
    - Request a new shuffled deck (GET)
    - Capture the deck_id from the response
    - Use the deck_id to draw a card from the deck
    - Repeat both with cURL and Postman
10. Wrap-Up and Reflection
    - Summarize what you learned about HTTP, APIs, cURL, and Postman
    - Discuss when each tool is most useful in network automation

## :page_facing_up: Logging
text

## :green_checkmark: Grading Breakdown
- x pts: 
- x pts:
- x pts: