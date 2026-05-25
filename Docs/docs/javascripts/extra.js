// Fix language switcher links to preserve version path for Mike deployments
document$.subscribe(function() {
  // Get current version path (e.g., /v0.0.7-Beta.1/ or /latest/)
  const pathParts = window.location.pathname.split('/').filter(Boolean);
  let versionPrefix = '';

  // Check if we're in a versioned directory
  if (pathParts.length > 0 && (pathParts[0].startsWith('v') || pathParts[0] === 'latest')) {
    versionPrefix = '/' + pathParts[0];
  }

  // Fix language switcher dropdown links
  const langLinks = document.querySelectorAll('.md-select__link');
  langLinks.forEach(function(link) {
    const href = link.getAttribute('href');
    if (href && href.startsWith('/')) {
      // Check if link already has version prefix
      if (!href.startsWith(versionPrefix) && !href.match(/^\/(v[\d\w.-]+|latest)\//)) {
        link.setAttribute('href', versionPrefix + href);
      }
    }
  });

  // Fix header language selector links (alternate languages)
  const headerLangLinks = document.querySelectorAll('header [hreflang]');
  headerLangLinks.forEach(function(link) {
    const href = link.getAttribute('href');
    if (href && href.startsWith('/')) {
      if (!href.startsWith(versionPrefix) && !href.match(/^\/(v[\d\w.-]+|latest)\//)) {
        link.setAttribute('href', versionPrefix + href);
      }
    }
  });
});

// Image carousel
document$.subscribe(function() {
  const carousels = document.querySelectorAll('.image-carousel');
  carousels.forEach(function(carousel) {
    if (carousel.dataset.initialized) return;
    carousel.dataset.initialized = '1';

    const slides = carousel.querySelectorAll('.carousel-slide');
    const dots = carousel.querySelectorAll('.carousel-dot');
    const prevBtn = carousel.querySelector('.carousel-prev');
    const nextBtn = carousel.querySelector('.carousel-next');
    let current = 0;
    let timer = null;
    const interval = 5000;

    function goTo(index) {
      slides[current].classList.remove('active');
      dots[current].classList.remove('active');
      current = (index + slides.length) % slides.length;
      slides[current].classList.add('active');
      dots[current].classList.add('active');
    }

    function next() { goTo(current + 1); }
    function prev() { goTo(current - 1); }

    function startTimer() {
      stopTimer();
      timer = setInterval(next, interval);
    }

    function stopTimer() {
      if (timer) { clearInterval(timer); timer = null; }
    }

    if (prevBtn) prevBtn.addEventListener('click', function() { prev(); startTimer(); });
    if (nextBtn) nextBtn.addEventListener('click', function() { next(); startTimer(); });

    dots.forEach(function(dot, i) {
      dot.addEventListener('click', function() { goTo(i); startTimer(); });
    });

    carousel.addEventListener('mouseenter', stopTimer);
    carousel.addEventListener('mouseleave', startTimer);

    // Touch swipe support
    let touchStartX = 0;
    carousel.addEventListener('touchstart', function(e) { touchStartX = e.touches[0].clientX; });
    carousel.addEventListener('touchend', function(e) {
      const diff = touchStartX - e.changedTouches[0].clientX;
      if (Math.abs(diff) > 40) {
        diff > 0 ? next() : prev();
        startTimer();
      }
    });

    startTimer();
  });
});
