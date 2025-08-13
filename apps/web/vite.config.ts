import react from '@vitejs/plugin-react-swc';
import { defineConfig } from 'vite';

// https://vite.dev/config/
export default defineConfig({
  // dev container needs server config to be host: true
  // to allow access from the host machine
  server: {
    host: true,
  },
  plugins: [react()],
});
