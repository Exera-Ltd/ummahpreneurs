# Google Sheets RSVP Form Setup Guide

Follow these steps to connect your RSVP form to Google Sheets using Google Apps Script.

Based on: https://github.com/mhawksey/html-form-send-email-via-google-script-without-server

## Step 1: Prepare Your Google Sheet

Make sure your Google Sheet has a sheet named **"Form responses 1"** with these column headers in Row 1:

```
Timestamp | Full Name | Contact Number (WhatsApp preferred) | Will you be attending the Ummahpreneurs Award Ceremony? | Will you be accompanied by a guest? | Photos and videos will be taken during the event. Do you consent to being featured on Ummahpreneurs' platforms (social media, website, reports)?
```

**Important:** The sheet name and column headers must match exactly (case-sensitive).

## Step 2: Add Apps Script

1. Open your Google Sheet
2. Click **Extensions** → **Apps Script**
3. Delete any existing code in the editor
4. Copy and paste the code from `google-apps-script.js` (in this folder)
5. Click the **Save** icon (💾) or press Ctrl+S
6. Name the project "RSVP Form Handler" (or any name you prefer)

## Step 3: Run Initial Setup

1. In the Apps Script editor, find the function dropdown (shows "Select function")
2. Select **`initialSetup`** from the dropdown
3. Click the **Run** button (▶️)
4. You'll see an "Authorization required" dialog - click **Review Permissions**
5. Choose your Google account
6. You may see a "This app isn't verified" warning - click **Advanced**
7. Click **Go to RSVP Form Handler (unsafe)**
8. Click **Allow** to grant the necessary permissions

✅ This links your Apps Script to your spreadsheet!

## Step 4: Deploy as Web App

1. Click **Deploy** → **New deployment**
2. Click the gear icon (⚙️) next to "Select type"
3. Choose **Web app**
4. Configure the deployment:
   - **Description:** RSVP Form (or any description)
   - **Execute as:** **Me** (your email address)
   - **Who has access:** **Anyone** (important!)
5. Click **Deploy**
6. If asked to authorize again, click **Authorize access** and allow permissions
7. **Copy the Web App URL** that appears - it will look like:
   ```
   https://script.google.com/macros/s/LONG_RANDOM_STRING/exec
   ```
8. Click **Done**

## Step 5: Update Your Website

1. Open `index.html` in your code editor
2. Find line 2279 (search for `YOUR_WEB_APP_URL_HERE`)
3. Replace `'YOUR_WEB_APP_URL_HERE'` with your actual Web App URL:
   ```javascript
   const scriptURL = 'https://script.google.com/macros/s/YOUR_ACTUAL_ID_HERE/exec';
   ```
4. Save the file

## Step 6: Test It!

1. Open your website in a browser
2. Click "RSVP for Award Ceremony"
3. Fill out the form with test data
4. Click "Submit RSVP"
5. Wait for the success message
6. Check your Google Sheet - you should see a new row with:
   - Timestamp (auto-generated)
   - All form data in the correct columns

## Troubleshooting

### "Authorization required" error
- Make sure you ran `initialSetup` function first (Step 3)
- Try running it again

### Form submission fails
- Check that "Who has access" is set to **Anyone** in deployment settings
- Verify the Web App URL is correct (no typos)
- Open browser console (F12) to see specific error messages

### Data not appearing in sheet
- Check that your sheet name is exactly **"Form responses 1"**
- Verify column headers match exactly (including spelling and capitalization)
- Make sure `initialSetup` was run successfully

### Need to update the script
1. Make changes in Apps Script editor
2. Click **Deploy** → **Manage deployments**
3. Click the edit icon (✏️ pencil) next to your deployment
4. Change version to **New version**
5. Click **Deploy**
6. The URL stays the same - no need to update the website!

## Why This Works

- **Simple & Reliable:** Uses Google's official Apps Script platform
- **No Third-Party Services:** Everything runs on Google's infrastructure
- **CORS-Friendly:** No cross-origin issues since it's a Web App
- **Free:** No cost for typical usage volumes

## Security Note

The Web App is set to "Anyone" access, which means anyone with the URL can submit. This is normal for public forms. The script only has access to your specific spreadsheet, not your entire Google account.

---

**That's it!** Your form is now connected to Google Sheets and will automatically record all RSVP submissions with timestamps.
