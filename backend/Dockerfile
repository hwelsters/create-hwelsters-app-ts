FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json .
COPY tsconfig.json .
COPY yarn.lock .

RUN yarn --pure-lockfile
RUN yarn install

COPY ./src ./src
RUN yarn build
RUN ls

FROM node:18-alpine
WORKDIR /app

COPY package*.json .
COPY tsconfig.json .
COPY yarn.lock .
RUN yarn install

# TODO: Quick bandaid fix
COPY --from=build /app/build ./src

CMD ["yarn", "start"]