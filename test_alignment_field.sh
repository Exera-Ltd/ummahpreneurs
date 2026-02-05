#!/bin/bash

# Test the alignment field with different variations

API_URL="https://sheet2api.com/v1/NYfj3fZHTL2x/investor-form-up-responses"

echo "=== Testing Alignment Field Variations ==="
echo ""

# Base payload that works
BASE='"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring","Availability:":"Weekends","Why do you want to support Ummahpreneurs?":"I want to help"'

# Test 1: With apostrophe in Ummahpreneurs'
echo "Test 1: With apostrophe in 'Ummahpreneurs'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "{$BASE,\"Do you align with Ummahpreneurs' values of ethical, Shariah-compliant entrepreneurship?\":\"Yes\"}"
echo ""
echo ""

# Test 2: Without apostrophe in Ummahpreneurs
echo "Test 2: Without apostrophe in 'Ummahpreneurs'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "{$BASE,\"Do you align with Ummahpreneurs values of ethical, Shariah-compliant entrepreneurship?\":\"Yes\"}"
echo ""
echo ""

# Test 3: Shortened field name
echo "Test 3: Just 'Do you align with Ummahpreneurs values?'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "{$BASE,\"Do you align with Ummahpreneurs values?\":\"Yes\"}"
echo ""
echo ""

# Test 4: Different variations
echo "Test 4: 'Align with values'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d "{$BASE,\"Align with values\":\"Yes\"}"
echo ""
echo ""

echo "=== Testing Complete ==="
