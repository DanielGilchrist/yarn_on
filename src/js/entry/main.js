// Add this line to the beginning of every entry script
import "vite/modulepreload-polyfill"
import "material-icons/iconfont/material-icons.css";

import "@css/tailwind.css";
import "@css/main.css"
import "@css/app.scss";
import "@js/app.js"

// Add static assets to the manifest (optional)
import.meta.glob([
  // "@images/**", // <- alias to src/images
  // "@fonts/**",  // <- alias to src/fonts
])


