// Google Apps Script for RSVP Form Submission (Enhanced Security)
// Based on: https://github.com/mhawksey/html-form-send-email-via-google-script-without-server

var sheetName = 'Form responses 1'
var scriptProp = PropertiesService.getScriptProperties()

// Optional: Set a daily submission limit per IP/user to prevent spam
var MAX_SUBMISSIONS_PER_DAY = 10

function initialSetup () {
  var activeSpreadsheet = SpreadsheetApp.getActiveSpreadsheet()
  scriptProp.setProperty('key', activeSpreadsheet.getId())
}

function doPost (e) {
  var lock = LockService.getScriptLock()
  lock.tryLock(10000)

  try {
    // OPTIONAL: Basic rate limiting (check submission count)
    // Uncomment the following lines if you want rate limiting:
    /*
    var userIp = e.parameter.userIp || 'unknown'
    var cacheKey = 'submissions_' + userIp + '_' + new Date().toDateString()
    var cache = CacheService.getScriptCache()
    var submissionCount = parseInt(cache.get(cacheKey) || '0')

    if (submissionCount >= MAX_SUBMISSIONS_PER_DAY) {
      return ContentService
        .createTextOutput(JSON.stringify({ 'result': 'error', 'error': 'Too many submissions. Please try again tomorrow.' }))
        .setMimeType(ContentService.MimeType.JSON)
    }
    */

    var doc = SpreadsheetApp.openById(scriptProp.getProperty('key'))
    var sheet = doc.getSheetByName(sheetName)

    // Server-side validation
    var fullName = e.parameter['Full Name']
    var contactNumber = e.parameter['Contact Number (WhatsApp preferred)']
    var attending = e.parameter['Will you be attending the Ummahpreneurs Award Ceremony?']

    // Validate required fields
    if (!fullName || !contactNumber || !attending) {
      return ContentService
        .createTextOutput(JSON.stringify({ 'result': 'error', 'error': 'Missing required fields' }))
        .setMimeType(ContentService.MimeType.JSON)
    }

    // Sanitize input to prevent script injection (basic cleanup)
    fullName = fullName.toString().substring(0, 100) // Limit length
    contactNumber = contactNumber.toString().substring(0, 20)

    var headers = sheet.getRange(1, 1, 1, sheet.getLastColumn()).getValues()[0]
    var nextRow = sheet.getLastRow() + 1

    var newRow = headers.map(function(header) {
      return header === 'Timestamp' ? new Date() : e.parameter[header]
    })

    sheet.getRange(nextRow, 1, 1, newRow.length).setValues([newRow])

    // OPTIONAL: Update rate limiting counter
    // Uncomment if you enabled rate limiting above:
    /*
    cache.put(cacheKey, (submissionCount + 1).toString(), 86400) // Cache for 24 hours
    */

    return ContentService
      .createTextOutput(JSON.stringify({ 'result': 'success', 'row': nextRow }))
      .setMimeType(ContentService.MimeType.JSON)
  }
  catch (e) {
    return ContentService
      .createTextOutput(JSON.stringify({ 'result': 'error', 'error': e.toString() }))
      .setMimeType(ContentService.MimeType.JSON)
  }
  finally {
    lock.releaseLock()
  }
}
