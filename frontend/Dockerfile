FROM node:16-alpine as builder
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --only=prod
COPY . /app
RUN npm run build

FROM nginx:1.21-alpine
COPY --from=builder /app/build /usr/share/nginx/html
## add permissions
RUN chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid
USER nginx

CMD ["nginx", "-g", "daemon off;"]
