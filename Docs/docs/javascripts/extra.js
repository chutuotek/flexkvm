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
