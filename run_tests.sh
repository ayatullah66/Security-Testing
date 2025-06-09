echo "Running Security API Tests via Newman"


# Step 1: Check if newman is installed
if ! command -v newman &> /dev/null
then
    echo "Newman not found. Installing..."
    npm install -g newman
else
    echo "Newman is already installed."
fi

# Step 2: Define collection and environment paths
COLLECTION="postman_tests/Security_testing_collection.json"
ENVIRONMENT="postman_tests/Security_testing_environment.json"
REPORT="postman_tests/test-report.json"

# Step 3: Run the Postman collection using Newman
newman run "$COLLECTION" \
  -e "$ENVIRONMENT" \
  --reporters cli,json \
  --reporter-json-export "$REPORT"

# Step 4: Done
echo "Test run complete. Report saved to $REPORT"
