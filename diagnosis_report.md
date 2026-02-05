# Sheet2API Integration Issue - Diagnosis Report

## Problem Summary
When posting data to the investor form API endpoint, the request fails with:
```json
{"detail":"Invalid new row data"}
```

## Root Cause Identified

The issue is with the **apostrophe character** in one of the column headers.

### The Mismatch

Looking at the actual column names returned from the API (from GET request):

```
"Do you align with Ummahpreneurs' values of ethical, Shariah-compliant entrepreneurship?"
```

The apostrophe in the Google Sheet is a **RIGHT SINGLE QUOTATION MARK (U+2019): '** 
- This is a "smart quote" or "curly quote"

But in the code ([`index.html`](index.html:2868)), the field uses a **standard apostrophe (U+0027): '**

### Visual Comparison

| Source | Character | Unicode | Appearance |
|--------|-----------|---------|------------|
| Google Sheet | RIGHT SINGLE QUOTATION MARK | U+2019 | ' (curly) |
| HTML/JS Code | APOSTROPHE | U+0027 | ' (straight) |

### The Problematic Field

**In the code ([`index.html:2868`](index.html:2868)):**
```javascript
'Do you align with Ummahpreneurs\' values of ethical, Shariah-compliant entrepreneurship?'
```

**In the actual Google Sheet column header:**
```
Do you align with Ummahpreneurs' values of ethical, Shariah-compliant entrepreneurship?
```

Note: The difference is subtle - the Google Sheet uses a curly apostrophe (') while the code uses a straight apostrophe (').

## Why Other Fields Work

All other 13 fields match exactly between the code and the Google Sheet. Only this one field has the apostrophe mismatch.

## Solution

The field name in [`index.html`](index.html:2868) needs to be updated to use the exact same apostrophe character as the Google Sheet column header.

### Option 1: Update the Code (Recommended)
Change the field name in [`index.html`](index.html:2868) from:
```javascript
'Do you align with Ummahpreneurs\' values of ethical, Shariah-compliant entrepreneurship?'
```
To use the curly apostrophe:
```javascript
'Do you align with Ummahpreneurs' values of ethical, Shariah-compliant entrepreneurship?'
```

### Option 2: Update the Google Sheet
Change the column header in the Google Sheet from the curly apostrophe (') to a standard apostrophe (').

## Verification

The field-by-field testing confirmed:
- Tests 1-13: All fields up to "Why do you want to support Ummahpreneurs?" work correctly
- Test 14: Adding the alignment field with the wrong apostrophe causes the error
- Tests 15-16: Subsequent fields also fail because they're tested after the problematic field

## Files Affected

- [`index.html`](index.html:2868) - Line 2868 in the JavaScript form submission handler
