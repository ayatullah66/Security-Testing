# 🔐 Security Automation for API Testing with Postman + OpenAI

This project automates API security testing using Postman and OpenAI. It simulates real-world attacks like **XSS**, **SQL Injection**, and **brute-force** to evaluate the resilience of APIs.

---

## 📁 Project Structure
- Postman :
- Security_testing_collection.json
- Security_testing_environment.json 
- tests_run.sh 
- run-postman-tests.yml
- README.md

---

## 🚀 Features

- Automatically generate attack payloads using OpenAI (e.g., XSS, SQLi)
- Inject malicious input into API fields
- Validate API response behavior (status, error handling, data leakage)
- Tests are executed using Newman CLI or CI/CD pipelines

---

## ⚙️ How It Works

### 1. Authentication Token

Each request gets a **valid token** dynamically in a `Pre-request Script`. It uses a login endpoint (e.g., `/auth/login`) to fetch the token and store it as an environment variable `auth_token`.

### 2. OpenAI for Security Payloads

Requests like "Create Parcel", "Update Bank Info", or "Forget Password" use `Pre-request Script` to call the OpenAI API and generate a malicious payload. Then it's injected via environment variables such as:

- `{{malicious_email}}`
- `{{malicious_parcels}}`
- `{{malicious_beneficiary}}`

---

## 🔧 Running Tests Locally

Make sure you have [Node.js](https://nodejs.org/) and [Newman](https://www.npmjs.com/package/newman) installed:

```bash
npm install -g newman
newman run postman/Security_testing_collection \
  --environment postman/Security_testing_environment.json
 
## 🔧 Run Tests via Newman

```bash
newman run postman_tests/Security\ testing\ collection.json \
  --environment postman_tests/Security\ testing\ environment.json \
  --env-var "openai_api_key=YOUR_OPENAI_KEY_HERE"

