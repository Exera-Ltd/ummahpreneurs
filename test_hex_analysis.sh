#!/bin/bash

# Get the exact column name and analyze it

API_URL="https://sheet2api.com/v1/NYfj3fZHTL2x/investor-form-up-responses"

echo "=== Fetching and analyzing column names ==="
echo ""

# Get the data and extract keys
curl -s -X GET "$API_URL" -H "Content-Type: application/json" | python3 << 'PYTHON_SCRIPT'
import json
import sys

data = json.load(sys.stdin)
if data and len(data) > 0:
    keys = list(data[0].keys())
    print("Column names in the Google Sheet:")
    print("=" * 60)
    for i, key in enumerate(keys, 1):
        print(f"{i}. {key}")
        # Show hex representation of any apostrophes
        if "'" in key or "'" in key or "\\u2019" in key:
            hex_vals = [hex(ord(c)) for c in key]
            print(f"   Hex: {' '.join(hex_vals)}")
    print("=" * 60)
    
    # Specifically look at the alignment field
    for key in keys:
        if "align" in key.lower():
            print(f"\nAlignment field: {key}")
            print(f"Character breakdown:")
            for i, c in enumerate(key):
                print(f"  [{i}] '{c}' = U+{ord(c):04X}")
PYTHON_SCRIPT

echo ""
echo "=== Analysis Complete ==="
