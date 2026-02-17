// vite.config.ts
import { defineConfig } from "vite";
import dnnAscx from "@violetrose/vite-plugin-dnn-ascx"

const skinPublicBase = "/Portals/_default/Skins/MySkin/";
const devOrigin = "http://localhost:5173";

export default defineConfig(({ command }) => ({
  base: command === "serve" ? devOrigin : skinPublicBase,
  server: {
    origin: devOrigin,
    cors: true,
  },
  plugins: [
    dnnAscx({
      ascxGlobs: [`**/*.ascx`],
      publicBase: skinPublicBase,
    }),
  ],
}));
