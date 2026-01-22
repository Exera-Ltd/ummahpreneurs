# Google Sheets RSVP Form Setup Guide

Follow these steps to connect your RSVP form to Google Sheets.

## Step 1: Your Existing Google Sheet

✅ You already have your Google Sheet set up with the correct headers:
```
Timestamp | Full Name | Contact Number (WhatsApp preferred) | Will you be attending the Ummahpreneurs Award Ceremony? | Will you be accompanied by a guest? | Photos and videos will be taken during the event. Do you consent to being featured on Ummahpreneurs' platforms (social media, website, reports)?
```

The form has been configured to match these exact column names.

## Step 2: Add Apps Script

1. In your Google Sheet, click **Extensions** → **Apps Script**
2. Delete any existing code
3. Copy and paste the code from `google-apps-script.js` (in this folder)
4. Click the **Save** icon (💾) or press Ctrl+S
5. Name the project "RSVP Form Handler"

## Step 3: Run Initial Setup

1. In the Apps Script editor, select `initialSetup` from the function dropdown
2. Click **Run** (▶️ button)
3. You'll be asked to authorize - click **Review Permissions**
4. Choose your Google account
5. Click **Advanced** → **Go to RSVP Form Handler (unsafe)**
6. Click **Allow**

## Step 4: Deploy as Web App

1. Click **Deploy** → **New deployment**
2. Click the gear icon ⚙️ next to "Select type"
3. Choose **Web app**
4. Fill in the settings:
   - **Description:** RSVP Form Submission
   - **Execute as:** Me (your email)
   - **Who has access:** Anyone
5. Click **Deploy**
6. **Copy the Web App URL** - you'll need this next!

## Step 5: Update Your Website

1. Open `index.html`
2. Find this line (around line 2198):
   ```javascript
   const scriptURL = 'YOUR_WEBAPP_URL_HERE';
   ```
3. Replace `'YOUR_WEBAPP_URL_HERE'` with your Web App URL in quotes:
   ```javascript
   const scriptURL = 'https://script.google.com/macros/s/YOUR_ACTUAL_URL/exec';
   ```
4. Save the file

## Step 6: Test It!

1. Open your website
2. Click "RSVP for Award Ceremony"
3. Fill out the form
4. Click "Submit RSVP"
5. Check your Google Sheet - you should see a new row with the submission!

## Troubleshooting

### Form doesn't submit
- Make sure you deployed as "Anyone" can access
- Check the browser console (F12) for errors
- Verify the Web App URL is correct

### Data not appearing in sheet
- Check the column headers match exactly
- Make sure `initialSetup` was run successfully
- Check Sheet1 is the correct sheet name (or update in script)

### Need to update the script
1. Make changes in Apps Script editor
2. Click **Deploy** → **Manage deployments**
3. Click the edit icon (✏️) next to your deployment
4. Click **Deploy** (the URL stays the same)

## Column Descriptions

- **Timestamp**: Auto-populated with submission date/time
- **Full Name**: Full name from form
- **Contact Number (WhatsApp preferred)**: Phone number
- **Will you be attending the Ummahpreneurs Award Ceremony?**: "Yes, I'll be there" or "Sorry, can't make it"
- **Will you be accompanied by a guest?**: "No" or "Yes (1 guest)"
- **Photos and videos... (consent)**: "Yes" or "No"

---

**That's it!** Your form is now connected to Google Sheets and will automatically record all RSVP submissions.
