#!/bin/bash

# Final verification test with the corrected field name

API_URL="https://sheet2api.com/v1/NYfj3fZHTL2x/investor-form-up-responses"

echo "=== Final Verification Test ==="
echo ""

# Test with all fields including the corrected alignment field
echo "Test: Full payload with corrected field name..."
curl -s -X POST "$API_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "Timestamp": "2026-02-05T14:13:53.043Z",
    "Name": "Test User",
    "Email": "test@test.com",
    "Address": "123 Main St",
    "Phone number": "1234567890",
    "Organisation / Company (if applicable)": "Test Co",
    "LinkedIn Profile or Website (if any)": "https://linkedin.com",
    "I would like to support Ummahpreneurs as:": "Both",
    "Type of financial support you are interested in:": "Grant/Donation",
    "Estimated contribution range (optional):": "Above Rs 500,000",
    "Preferred structure (if investment):": "Equity/Shares",
    "How would you like to contribute your time or skills?": "Mentoring",
    "Availability:": "Weekends",
    "Why do you want to support Ummahpreneurs?": "I want to help",
    "Do you align with Ummahpreneurs'"'"' values of ethical, Shariah-compliant entrepreneurship?": "Yes",
    "How would you like to stay engaged with Ummahpreneurs?": "Events",
    "I consent to Ummahpreneurs contacting me regarding my interest and support.": "Yes"
  }'
echo ""
echo ""

echo "=== Test Complete ==="
