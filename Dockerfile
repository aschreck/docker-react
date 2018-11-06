FROM node:alpine as builder
WORKDIR '/app'

#all the relevant files will be in /app/build/*
COPY package.json .

RUN npm install

COPY . .

RUN npm run build


#RUN PHASE

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html