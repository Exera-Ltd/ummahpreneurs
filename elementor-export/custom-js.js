/* Ummahpreneurs Mauritius - Custom JavaScript for Elementor */
/* Add this to your WordPress theme's custom JS or using a plugin like "Insert Headers and Footers" */

document.addEventListener('DOMContentLoaded', function() {
    // Set dynamic year in footer
    const yearElements = document.querySelectorAll('.current-year');
    yearElements.forEach(function(el) {
        el.textContent = new Date().getFullYear();
    });

    // Modal Functions
    window.openCommunityModal = function() {
        const modal = document.getElementById('communityModal');
        if (modal) {
            modal.style.display = 'block';
            document.body.style.overflow = 'hidden';
        }
    };

    window.closeCommunityModal = function() {
        const modal = document.getElementById('communityModal');
        if (modal) {
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    };

    window.openRSVPModal = function() {
        const modal = document.getElementById('rsvpModal');
        if (modal) {
            modal.style.display = 'block';
            document.body.style.overflow = 'hidden';
            // Reset form
            const form = document.getElementById('rsvpForm');
            if (form) {
                form.reset();
            }
            const formContainer = document.getElementById('rsvpFormContainer');
            const formSuccess = document.getElementById('formSuccess');
            if (formContainer) formContainer.style.display = 'block';
            if (formSuccess) formSuccess.classList.remove('show');
        }
    };

    window.closeRSVPModal = function() {
        const modal = document.getElementById('rsvpModal');
        if (modal) {
            modal.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    };

    // Close modal when clicking outside
    window.onclick = function(event) {
        const communityModal = document.getElementById('communityModal');
        const rsvpModal = document.getElementById('rsvpModal');
        if (event.target === communityModal) {
            closeCommunityModal();
        }
        if (event.target === rsvpModal) {
            closeRSVPModal();
        }
    };

    // Close modal with Escape key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeCommunityModal();
            closeRSVPModal();
            closeLightbox();
        }
    });

    // Lightbox functionality
    const galleryImages = [
        'media/1.jpeg', 'media/2.jpeg', 'media/3.jpeg', 'media/4.jpeg',
        'media/5.jpeg', 'media/6.jpeg', 'media/7.jpeg', 'media/8.jpeg',
        'media/9.jpeg', 'media/10.jpeg', 'media/11.jpeg', 'media/12.jpeg',
        'media/13.jpeg', 'media/14.jpeg', 'media/15.jpeg', 'media/16.jpeg',
        'media/17.jpeg', 'media/18.jpeg'
    ];
    let currentImageIndex = 0;

    window.openLightbox = function(index) {
        currentImageIndex = index;
        const lightbox = document.getElementById('lightbox');
        if (lightbox) {
            lightbox.style.display = 'block';
            document.body.style.overflow = 'hidden';
            updateLightboxImage();
        }
    };

    window.closeLightbox = function() {
        const lightbox = document.getElementById('lightbox');
        if (lightbox) {
            lightbox.style.display = 'none';
            document.body.style.overflow = 'auto';
        }
    };

    window.changeImage = function(direction) {
        currentImageIndex += direction;
        if (currentImageIndex < 0) {
            currentImageIndex = galleryImages.length - 1;
        } else if (currentImageIndex >= galleryImages.length) {
            currentImageIndex = 0;
        }
        updateLightboxImage();
    };

    function updateLightboxImage() {
        const lightboxImage = document.getElementById('lightbox-image');
        const lightboxCounter = document.getElementById('lightbox-counter');
        if (lightboxImage) {
            lightboxImage.src = galleryImages[currentImageIndex];
        }
        if (lightboxCounter) {
            lightboxCounter.textContent = (currentImageIndex + 1) + ' / ' + galleryImages.length;
        }
    }

    // Keyboard navigation for lightbox
    document.addEventListener('keydown', function(event) {
        const lightbox = document.getElementById('lightbox');
        if (lightbox && lightbox.style.display === 'block') {
            if (event.key === 'ArrowLeft') {
                changeImage(-1);
            } else if (event.key === 'ArrowRight') {
                changeImage(1);
            } else if (event.key === 'Escape') {
                closeLightbox();
            }
        }
    });

    // Scroll to Top functionality
    const scrollToTopBtn = document.getElementById('scrollToTop');
    
    if (scrollToTopBtn) {
        // Show/hide button based on scroll position
        window.addEventListener('scroll', function() {
            if (window.pageYOffset > 300) {
                scrollToTopBtn.classList.add('show');
            } else {
                scrollToTopBtn.classList.remove('show');
            }
        });

        // Scroll to top function
        scrollToTopBtn.addEventListener('click', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    }

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(function(anchor) {
        anchor.addEventListener('click', function(e) {
            if (this.getAttribute('onclick')) return; // Skip if has onclick
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Scroll-triggered animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -100px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(function(entry) {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Animate sections on scroll
    const animatedElements = document.querySelectorAll('.stat-card, .service-card, .founder-card, .mission-card');
    animatedElements.forEach(function(el, index) {
        el.style.opacity = '0';
        el.style.transform = 'translateY(30px)';
        el.style.transition = 'all 0.6s ease-out';
        el.style.transitionDelay = (index * 0.1) + 's';
        observer.observe(el);
    });

    // RSVP Form Submission to Google Sheets
    const rsvpForm = document.getElementById('rsvpForm');
    if (rsvpForm) {
        // Replace with your actual Google Apps Script Web App URL
        const scriptURL = 'https://script.google.com/macros/s/AKfycbz1UWL7usIsk6-FK5VdVQs7tYzJULDX6bqjcFFI9ZvnL4NgOnzqCCpv8CtKI_D14ZtPlg/exec';

        rsvpForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const submitBtn = document.getElementById('submitBtn');
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.textContent = 'Submitting...';
            }

            // Submit form data
            fetch(scriptURL, {
                method: 'POST',
                body: new FormData(this)
            })
            .then(function(response) { return response.json(); })
            .then(function(data) {
                console.log('Success:', data);
                // Hide form, show success message
                const formContainer = document.getElementById('rsvpFormContainer');
                const formSuccess = document.getElementById('formSuccess');
                if (formContainer) formContainer.style.display = 'none';
                if (formSuccess) formSuccess.classList.add('show');
                // Reset form
                rsvpForm.reset();
            })
            .catch(function(error) {
                console.error('Error:', error);
                alert('There was an error submitting your RSVP. Please try again or contact us directly at info@ummahpreneurs.org');
            })
            .finally(function() {
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.textContent = 'Submit RSVP';
                }
            });
        });
    }

    // Counter Animation for Stats
    function animateCounter(element, target, duration) {
        let start = 0;
        const increment = target / (duration / 16);
        
        function updateCounter() {
            start += increment;
            if (start < target) {
                element.textContent = Math.floor(start);
                requestAnimationFrame(updateCounter);
            } else {
                element.textContent = target;
            }
        }
        
        updateCounter();
    }

    // Trigger counter animation when stats section is in view
    const statsSection = document.querySelector('.stats-section');
    if (statsSection) {
        const statsObserver = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    const counters = entry.target.querySelectorAll('.stat-number');
                    counters.forEach(function(counter) {
                        const target = parseInt(counter.getAttribute('data-target'));
                        if (target) {
                            animateCounter(counter, target, 2000);
                        }
                    });
                    statsObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });

        statsObserver.observe(statsSection);
    }

    // Add click handlers for gallery images
    const galleryImageElements = document.querySelectorAll('.gallery-image');
    galleryImageElements.forEach(function(img, index) {
        img.addEventListener('click', function() {
            openLightbox(index);
        });
    });

    // Prevent lightbox content click from closing
    const lightboxContent = document.querySelector('.lightbox-content');
    if (lightboxContent) {
        lightboxContent.addEventListener('click', function(e) {
            e.stopPropagation();
        });
    }

    // Mobile Menu Toggle (if needed)
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    const mobileMenu = document.querySelector('.mobile-menu');
    
    if (mobileMenuToggle && mobileMenu) {
        mobileMenuToggle.addEventListener('click', function() {
            mobileMenu.classList.toggle('active');
            mobileMenuToggle.classList.toggle('active');
        });
    }

    // Form validation enhancement
    const forms = document.querySelectorAll('form');
    forms.forEach(function(form) {
        form.addEventListener('submit', function(e) {
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            requiredFields.forEach(function(field) {
                if (!field.value.trim()) {
                    isValid = false;
                    field.style.borderColor = '#dc3545';
                } else {
                    field.style.borderColor = '';
                }
            });

            if (!isValid) {
                e.preventDefault();
                alert('Please fill in all required fields.');
            }
        });
    });

    // Lazy loading for images
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver(function(entries) {
            entries.forEach(function(entry) {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    if (img.dataset.src) {
                        img.src = img.dataset.src;
                        img.removeAttribute('data-src');
                    }
                    imageObserver.unobserve(img);
                }
            });
        });

        document.querySelectorAll('img[data-src]').forEach(function(img) {
            imageObserver.observe(img);
        });
    }

    // Parallax effect for hero section (optional)
    const heroSection = document.querySelector('.hero-section');
    if (heroSection && !window.matchMedia('(pointer: coarse)').matches) {
        window.addEventListener('scroll', function() {
            const scrolled = window.pageYOffset;
            const rate = scrolled * 0.5;
            heroSection.style.backgroundPositionY = rate + 'px';
        });
    }

    // FAQ Accordion enhancement
    const faqItems = document.querySelectorAll('.elementor-toggle-item');
    faqItems.forEach(function(item) {
        const title = item.querySelector('.elementor-tab-title');
        if (title) {
            title.addEventListener('click', function() {
                // Close other items
                faqItems.forEach(function(otherItem) {
                    if (otherItem !== item) {
                        otherItem.classList.remove('active');
                    }
                });
                // Toggle current item
                item.classList.toggle('active');
            });
        }
    });

    // Console greeting
    console.log('%cUmmahpreneurs Mauritius', 'color: #4db8a8; font-size: 24px; font-weight: bold;');
    console.log('%cBuilding Businesses With Barakah', 'color: #3e4f5f; font-size: 14px;');
});

// Google Apps Script Integration Helper
// This function can be used to set up the Google Sheets integration
function setupGoogleSheetsIntegration() {
    console.log('To set up Google Sheets integration:');
    console.log('1. Create a new Google Sheet');
    console.log('2. Go to Extensions > Apps Script');
    console.log('3. Replace the code with the provided google-apps-script.js content');
    console.log('4. Deploy as Web App');
    console.log('5. Copy the Web App URL and update the scriptURL variable in custom-js.js');
}