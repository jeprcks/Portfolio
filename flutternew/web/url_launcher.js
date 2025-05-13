// Robust JavaScript function to open URLs
function openUrl(url) {
  try {
    // Create an anchor element
    var a = document.createElement('a');
    a.href = url;
    a.target = '_blank';
    a.rel = 'noopener noreferrer'; // Security best practice
    
    // Append to body, click, and remove
    document.body.appendChild(a);
    a.click();
    document.body.removeChild(a);
    
    return true;
  } catch (e) {
    console.error('Error opening URL:', e);
    return false;
  }
}
