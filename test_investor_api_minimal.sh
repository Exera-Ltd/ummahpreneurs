#!/bin/bash

# Test with minimal required fields first
curl -X POST "https://sheet2api.com/v1/NYfj3fZHTL2x/investor-form-up-responses" \
  -H "Content-Type: application/json" \
  -d '{"Name":"Test User"}'
