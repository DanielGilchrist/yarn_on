import { defineConfig } from "vite";
import luckyPlugin from "vite-plugin-lucky";

export default defineConfig({
  plugins: [luckyPlugin()],
  css: {
    devSourcemap: true,
    postcss: {
      plugins: [
        require("@tailwindcss/postcss"),
      ],
    },
  },
});
