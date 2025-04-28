// Auto-dismiss success/info flash messages after 2.5s, alerts/errors only close manually

// Function to handle flash close button clicks
function setupFlashCloseHandlers() {
  console.log("[flash.js] Setting up flash close handlers");
  document.querySelectorAll(".flash-close").forEach(button => {
    button.addEventListener("click", function() {
      console.log("[flash.js] Close button clicked");
      const el = this.closest(".flash-message");
      if (el) {
        el.classList.add("opacity-0", "pointer-events-none", "transition-opacity", "duration-500");
        setTimeout(() => el.remove(), 500);
      }
    });
  });
}

// Function to auto-dismiss success/info flashes
function autoDismissFlashes() {
  console.log("[flash.js] Auto-dismissing flashes");
  document.querySelectorAll("#flash-messages > .flash-message").forEach((el) => {
    // Only auto-dismiss if NOT an error/alert (i.e., not red)
    const isError = el.classList.contains("text-red-700") || el.classList.contains("border-red-500");
    if (!isError) {
      setTimeout(() => {
        el.classList.add("opacity-0", "pointer-events-none", "transition-opacity", "duration-500");
        setTimeout(() => el.remove(), 500);
      }, 2500);
    }
  });
}

// Initialize flash functionality
function initFlash() {
  console.log("[flash.js] Initializing flash functionality");
  setupFlashCloseHandlers();
  autoDismissFlashes();
}

// Run on initial page load
document.addEventListener("DOMContentLoaded", initFlash);

// Run on Turbo navigation
document.addEventListener("turbo:load", initFlash);

// Run when Turbo renders a frame (for Turbo Frames and Streams)
document.addEventListener("turbo:render", initFlash);
