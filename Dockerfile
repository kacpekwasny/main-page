FROM klakegg/hugo:0.111.3-ext-alpine AS builder
WORKDIR /app

COPY . .

# --gc removes unused cache files, --minify compresses HTML
RUN hugo --gc --minify

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html
COPY --from=builder /app/public /usr/share/nginx/html

