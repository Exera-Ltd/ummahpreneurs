# Ummahpreneurs Mauritius - Elementor Import Package

This package contains everything needed to import the Ummahpreneurs Mauritius website into WordPress using Elementor.

## 📦 Package Contents

```
elementor-export/
├── ummahpreneurs-complete.json    # Main Elementor template export
├── custom-css.css                  # Custom CSS styles
├── custom-js.js                    # Custom JavaScript functionality
├── media/                          # Gallery images (18 photos)
├── logo.png                        # Main logo
├── logo_with_bg.jpeg               # Logo with background
├── mujahid.jpeg                    # Founder image
├── anas.jpeg                       # Founder image
├── qaysar.jpeg                     # Founder image
└── Agenda.pdf                      # Event agenda
```

## 🚀 Installation Instructions

### Step 1: Install Required Plugins

1. Install and activate **Elementor** (free version)
2. Install and activate **Elementor Pro** (recommended for advanced features)
3. Install **Font Awesome** plugin or enable it in Elementor settings

### Step 2: Import Google Fonts

Add these fonts to your WordPress site:

1. Go to **Elementor > Settings > Advanced**
2. Or use a plugin like "Custom Fonts" or "Use Any Font"
3. Add the following Google Fonts:
   - **Montserrat** (weights: 300, 400, 600, 700, 800)
   - **Geomanist** (weights: 400, 700, 800)

Alternative: Add this to your theme's `functions.php`:

```php
function enqueue_ummahpreneurs_fonts() {
    wp_enqueue_style('google-fonts-montserrat', 'https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;600;700;800&display=swap', false);
    wp_enqueue_style('fontshare-geomanist', 'https://api.fontshare.com/v2/css?f[]=geomanist@400,700,800&display=swap', false);
}
add_action('wp_enqueue_scripts', 'enqueue_ummahpreneurs_fonts');
```

### Step 3: Upload Media Files

1. Go to **Media > Add New** in WordPress admin
2. Upload all images from the `elementor-export` folder:
   - `logo.png`
   - `logo_with_bg.jpeg`
   - `mujahid.jpeg`
   - `anas.jpeg`
   - `qaysar.jpeg`
   - All images in `media/` folder (1.jpeg through 18.jpeg)
   - `Agenda.pdf`

### Step 4: Import Elementor Template

#### Method A: Using Elementor Template Import

1. Go to **Pages > Add New**
2. Click **Edit with Elementor**
3. Click the folder icon (Templates) at the bottom
4. Go to **My Templates** tab
5. Click **Import Templates**
6. Select `ummahpreneurs-complete.json`
7. Insert the template into your page

#### Method B: Using All-in-One WP Migration (Recommended for complete site)

If you have a fresh WordPress installation:

1. Install **All-in-One WP Migration** plugin
2. Use the Elementor export to manually recreate the page
3. Or use the JSON import method above

### Step 5: Add Custom CSS

1. Go to **Appearance > Customize > Additional CSS**
2. Copy and paste the entire contents of `custom-css.css`
3. Click **Publish**

Alternative: Add CSS via Elementor:
- Click the hamburger menu (☰) in Elementor
- Go to **Site Settings > Custom CSS**
- Paste the CSS

### Step 6: Add Custom JavaScript

Option 1: Using a plugin (Recommended)
1. Install **Insert Headers and Footers** plugin
2. Go to **Settings > Insert Headers and Footers**
3. Paste the contents of `custom-js.js` in the "Scripts in Footer" section

Option 2: Using functions.php
```php
function enqueue_ummahpreneurs_scripts() {
    wp_enqueue_script('ummahpreneurs-custom', get_template_directory_uri() . '/js/custom-js.js', array('jquery'), '1.0', true);
}
add_action('wp_enqueue_scripts', 'enqueue_ummahpreneurs_scripts');
```

### Step 7: Update Image URLs

After importing, you may need to update image URLs:

1. In Elementor, select each image widget
2. Replace the placeholder URLs with your uploaded media
3. Use the WordPress media library to select the correct images

### Step 8: Configure Page Settings

1. Set page template to **Elementor Canvas** or **Elementor Full Width**
2. Set page title: "Ummahpreneurs Mauritius | Building Businesses With Barakah"
3. Set permalink to: `home` or `ummahpreneurs`

### Step 9: Set as Homepage

1. Go to **Settings > Reading**
2. Set "Your homepage displays" to "A static page"
3. Select the imported page as your homepage

## 🎨 Color Scheme

The website uses these brand colors:

- **Navy**: `#3e4f5f` - Primary dark color
- **Deep Blue**: `#2a3845` - Secondary dark color
- **Teal**: `#4db8a8` - Primary accent color
- **Teal Dark**: `#3da598` - Hover states
- **White**: `#ffffff` - Text on dark backgrounds
- **Off-White**: `#f8f9fa` - Light backgrounds
- **Text Gray**: `#6c757d` - Secondary text

## 📱 Features Included

### Sections
1. **Hero Section** - Logo, title, tagline, CTA button
2. **Stats Section** - Journey in numbers (185, 55, 37, 5)
3. **About Section** - Who We Are
4. **Mission/Vision Section** - 3 cards with icons
5. **Founders Section** - 3 founder profiles
6. **Services Section** - 4 service cards
7. **Why It Matters Section** - 4 benefit points
8. **Past Projects Section** - Timeline
9. **Process Section** - 4-step process
10. **Testimonials Section** - 3 testimonials
11. **Gallery Section** - 18 images
12. **FAQ Section** - 5 accordion items
13. **Calendar Section** - 2026 events
14. **Contact Section** - Contact info and social links
15. **Footer** - Copyright and credits

### Interactive Features
- **Modal Popups** - Community join modal, RSVP modal
- **Lightbox Gallery** - Click images to view fullscreen
- **Scroll to Top Button** - Appears after scrolling
- **Form Handling** - RSVP form with Google Sheets integration
- **Animations** - Scroll-triggered fade-in effects
- **Hover Effects** - Cards lift and glow on hover

## 🔧 Google Sheets Integration

The RSVP form submits to Google Sheets. To set this up:

1. Create a new Google Sheet
2. Go to **Extensions > Apps Script**
3. Replace the code with the contents of `google-apps-script.js` from the original project
4. Deploy as Web App
5. Update the `scriptURL` in `custom-js.js` with your Web App URL

## 📝 Notes

### Fonts
- **Geomanist** is used for headings. If unavailable, fallback to Montserrat or use a similar geometric sans-serif font.
- **Montserrat** is used for body text.

### Responsive Design
The template is fully responsive and includes:
- Mobile-optimized layouts
- Touch-friendly buttons
- Responsive typography
- Mobile menu (if header is added)

### SEO
The original site includes:
- Schema.org structured data
- Meta tags for social sharing
- Canonical URLs
- Semantic HTML

You should add an SEO plugin like **Yoast SEO** or **Rank Math** to maintain these features.

### Performance
- Images are optimized
- Lazy loading is implemented
- CSS and JS are minified
- Consider using a caching plugin like **WP Rocket** or **W3 Total Cache**

## 🐛 Troubleshooting

### Issue: Fonts not loading
**Solution**: Ensure Google Fonts are properly enqueued or use the Custom Fonts plugin

### Issue: Images not showing
**Solution**: Re-upload images through WordPress media library and update URLs in Elementor

### Issue: JavaScript not working
**Solution**: Check browser console for errors, ensure jQuery is loaded, verify script is in footer

### Issue: CSS not applying
**Solution**: Clear browser cache, check for CSS specificity conflicts, verify CSS is loaded

### Issue: Modal not opening
**Solution**: Ensure JavaScript is properly loaded, check for JavaScript errors in console

## 📞 Support

For issues or questions:
1. Check Elementor documentation: https://elementor.com/help/
2. Review WordPress codex: https://codex.wordpress.org/
3. Contact your web developer

## 🔄 Updates

To update the site in the future:
1. Make changes in Elementor
2. Export the template: Templates > Save as Template
3. Backup the JSON file
4. Version control your changes

## ✅ Post-Import Checklist

- [ ] All images uploaded and linked correctly
- [ ] Fonts displaying properly
- [ ] Custom CSS applied
- [ ] Custom JavaScript working
- [ ] Mobile responsive check
- [ ] All buttons and links working
- [ ] Forms submitting correctly
- [ ] SEO meta tags configured
- [ ] SSL certificate active (HTTPS)
- [ ] Analytics tracking code added
- [ ] Backup created

---

**Original Site**: https://ummahpreneurs.org
**Created**: January 2026
**Platform**: WordPress + Elementor