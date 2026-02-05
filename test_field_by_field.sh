#!/bin/bash

# Test API field by field to identify the mismatch
# Start with known working field and add one at a time

API_URL="https://sheet2api.com/v1/NYfj3fZHTL2x/investor-form-up-responses"

echo "=== Testing Field by Field ==="
echo ""

# Test 1: Just Name (known working)
echo "Test 1: Name only..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User"}'
echo ""
echo ""

# Test 2: Name + Email
echo "Test 2: Name + Email..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com"}'
echo ""
echo ""

# Test 3: Name + Email + Address
echo "Test 3: Name + Email + Address..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St"}'
echo ""
echo ""

# Test 4: Name + Email + Address + Phone number
echo "Test 4: Name + Email + Address + Phone number..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890"}'
echo ""
echo ""

# Test 5: Add Organisation / Company (if applicable)
echo "Test 5: Adding Organisation / Company (if applicable)..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co"}'
echo ""
echo ""

# Test 6: Add LinkedIn Profile or Website (if any)
echo "Test 6: Adding LinkedIn Profile or Website (if any)..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com"}'
echo ""
echo ""

# Test 7: Add I would like to support Ummahpreneurs as:
echo "Test 7: Adding 'I would like to support Ummahpreneurs as:'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both"}'
echo ""
echo ""

# Test 8: Add Type of financial support you are interested in:
echo "Test 8: Adding 'Type of financial support you are interested in:'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation"}'
echo ""
echo ""

# Test 9: Add Estimated contribution range (optional):
echo "Test 9: Adding 'Estimated contribution range (optional):'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000"}'
echo ""
echo ""

# Test 10: Add Preferred structure (if investment):
echo "Test 10: Adding 'Preferred structure (if investment):'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares"}'
echo ""
echo ""

# Test 11: Add How would you like to contribute your time or skills?
echo "Test 11: Adding 'How would you like to contribute your time or skills?'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring"}'
echo ""
echo ""

# Test 12: Add Availability:
echo "Test 12: Adding 'Availability:'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring","Availability:":"Weekends"}'
echo ""
echo ""

# Test 13: Add Why do you want to support Ummahpreneurs?
echo "Test 13: Adding 'Why do you want to support Ummahpreneurs?'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring","Availability:":"Weekends","Why do you want to support Ummahpreneurs?":"I want to help"}'
echo ""
echo ""

# Test 14: Add Do you align with Ummahpreneurs' values of ethical, Shariah-compliant entrepreneurship?
echo "Test 14: Adding 'Do you align with Ummahpreneurs values...'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring","Availability:":"Weekends","Why do you want to support Ummahpreneurs?":"I want to help","Do you align with Ummahpreneurs'\'' values of ethical, Shariah-compliant entrepreneurship?":"Yes"}'
echo ""
echo ""

# Test 15: Add How would you like to stay engaged with Ummahpreneurs?
echo "Test 15: Adding 'How would you like to stay engaged with Ummahpreneurs?'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring","Availability:":"Weekends","Why do you want to support Ummahpreneurs?":"I want to help","Do you align with Ummahpreneurs'\'' values of ethical, Shariah-compliant entrepreneurship?":"Yes","How would you like to stay engaged with Ummahpreneurs?":"Events"}'
echo ""
echo ""

# Test 16: Add I consent to Ummahpreneurs contacting me regarding my interest and support.
echo "Test 16: Adding 'I consent to Ummahpreneurs contacting me regarding my interest and support.'..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User","Email":"test@test.com","Address":"123 Main St","Phone number":"1234567890","Organisation / Company (if applicable)":"Test Co","LinkedIn Profile or Website (if any)":"https://linkedin.com","I would like to support Ummahpreneurs as:":"Both","Type of financial support you are interested in:":"Grant/Donation","Estimated contribution range (optional):":"Above Rs 500,000","Preferred structure (if investment):":"Equity/Shares","How would you like to contribute your time or skills?":"Mentoring","Availability:":"Weekends","Why do you want to support Ummahpreneurs?":"I want to help","Do you align with Ummahpreneurs'\'' values of ethical, Shariah-compliant entrepreneurship?":"Yes","How would you like to stay engaged with Ummahpreneurs?":"Events","I consent to Ummahpreneurs contacting me regarding my interest and support.":"Yes"}'
echo ""
echo ""

echo "=== Testing Complete ==="
