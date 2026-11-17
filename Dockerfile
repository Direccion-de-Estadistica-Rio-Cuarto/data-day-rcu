# Landing Data Day Río Cuarto 2026: sitio estático servido con nginx
FROM nginx:1.27-alpine

# Configuración del servidor (compresión, caché y cabeceras)
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Archivos del sitio
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/
COPY fonts/ /usr/share/nginx/html/fonts/
COPY compartir/ /usr/share/nginx/html/compartir/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -q --spider http://127.0.0.1/ || exit 1
