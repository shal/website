FROM node:alpine as builder

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

RUN yarn build

FROM nginx:alpine

COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

RUN nginx -t

COPY --from=builder /app/dist/ /dist

EXPOSE 8080

# CMD ["http-server", "dist"]
