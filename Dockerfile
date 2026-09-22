# Static site — no build step. Copy the HTML + assets + SEO pages into nginx and serve.
# Only site files are copied (not .git / .htaccess / deploy artifacts), so the web root stays clean.
FROM nginx:1.27-alpine

COPY deploy/nginx.conf /etc/nginx/conf.d/default.conf
COPY *.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/
COPY seo/ /usr/share/nginx/html/seo/
COPY robots.txt sitemap.xml /usr/share/nginx/html/

EXPOSE 80
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD wget -qO- http://127.0.0.1/ >/dev/null 2>&1 || exit 1
