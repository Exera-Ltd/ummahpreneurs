#!/bin/bash

# Try to fetch existing data to see the actual column names

API_URL="https://sheet2api.com/v1/NYfj3fZHTL2x/investor-form-up-responses"

echo "=== Fetching existing data to see column names ==="
echo ""

curl -s -X GET "$API_URL" \
  -H "Content-Type: application/json" | head -c 2000

echo ""
echo ""
echo "=== Done ==="
