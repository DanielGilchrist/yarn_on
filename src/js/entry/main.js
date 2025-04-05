// Add this line to the beginning of every entry script
import "vite/modulepreload-polyfill"

import "@css/tailwind.css";
import "@css/main.css"
import "@css/app.scss";

// Add static assets to the manifest (optional)
import.meta.glob([
  // "@images/**", // <- alias to src/images
  // "@fonts/**",  // <- alias to src/fonts
])


