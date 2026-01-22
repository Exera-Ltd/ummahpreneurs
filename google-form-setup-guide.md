# Google Form Direct Submission Setup Guide

This method submits directly to your Google Form without needing Apps Script.

## Step 1: Get Your Form Entry IDs

1. Open your Google Form in **edit mode**
2. Click the "Preview" button (eye icon) to open the live form
3. Right-click on the page and select **"View Page Source"** or press `Ctrl+U` (Windows) / `Cmd+Option+U` (Mac)
4. Search for `entry.` in the source code (Ctrl+F / Cmd+F)
5. You'll find lines like:
   ```html
   <input type="text" name="entry.123456789" ...>
   <input type="text" name="entry.987654321" ...>
   ```

6. Match each field to its entry ID:
   - **Full Name** → `entry.XXXXXXXXX`
   - **Contact Number (WhatsApp preferred)** → `entry.XXXXXXXXX`
   - **Will you be attending...** → `entry.XXXXXXXXX`
   - **Will you be accompanied by a guest?** → `entry.XXXXXXXXX`
   - **Photos and videos consent** → `entry.XXXXXXXXX`

## Step 2: Get Your Form ID

From your Google Form URL:
```
https://docs.google.com/forms/d/YOUR_FORM_ID_HERE/edit
```

Copy the `YOUR_FORM_ID_HERE` part.

## Step 3: Update the Website

I've already updated your `index.html` file. You just need to:

1. Open [index.html](index.html)
2. Find the section around line 2280 that says:
   ```javascript
   const formConfig = {
       formId: 'YOUR_FORM_ID_HERE',
       fields: {
           fullName: 'entry.XXXXXXXXX',
           contactNumber: 'entry.XXXXXXXXX',
           attending: 'entry.XXXXXXXXX',
           guest: 'entry.XXXXXXXXX',
           mediaConsent: 'entry.XXXXXXXXX'
       }
   };
   ```

3. Replace:
   - `YOUR_FORM_ID_HERE` with your actual Form ID
   - Each `entry.XXXXXXXXX` with the correct entry ID from Step 1

## Example

If your form has these entry IDs:
- Full Name: `entry.123456789`
- Contact Number: `entry.234567890`
- Attending: `entry.345678901`
- Guest: `entry.456789012`
- Media Consent: `entry.567890123`

Your config would look like:
```javascript
const formConfig = {
    formId: '1a2b3c4d5e6f7g8h9i0j',
    fields: {
        fullName: 'entry.123456789',
        contactNumber: 'entry.234567890',
        attending: 'entry.345678901',
        guest: 'entry.456789012',
        mediaConsent: 'entry.567890123'
    }
};
```

## Step 4: Test It!

1. Open your website
2. Click "RSVP for Award Ceremony"
3. Fill out the form
4. Click "Submit RSVP"
5. Check your Google Form responses - you should see a new entry!

## Why This Works

This method:
- Submits directly to Google Forms' `/formResponse` endpoint
- Uses a hidden iframe to avoid redirect issues
- Doesn't require Apps Script or Web App deployment
- Works around CORS restrictions by submitting to an iframe

## Troubleshooting

### Form doesn't submit
- Double-check all entry IDs are correct
- Make sure Form ID is correct
- Ensure your Google Form is set to accept responses

### Data appears incorrect
- Verify the entry IDs match the correct fields
- Check that radio button values match your form's options exactly

### Still having issues?
- Open browser console (F12) and look for error messages
- Verify your Google Form is publicly accessible
- Make sure the form accepts responses (not closed)
