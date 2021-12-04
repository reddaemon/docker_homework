FROM node:16-alpine as builder
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm install --only=prod
COPY . /app
RUN npm run build

FROM nginx:1.21-alpine
COPY --from=builder /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
