// import { defineConfig } from 'vite'
// import react from '@vitejs/plugin-react'

// export default defineConfig({
//   plugins: [react()],
// })


import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      "/api": {
        target: "http://sbe:5000",
        changeOrigin: true
      }
    }
  },
  preview: {
    host: true,
    port: 4173,
    proxy: {
      "/api": {
        target: "http://sbe:5000",
        changeOrigin: true
      }
    }
  }
})