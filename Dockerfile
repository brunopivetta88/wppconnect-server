FROM node:22.18.0

RUN apt-get update && apt-get install -y \
  build-essential \
  libcairo2-dev \
  libpango1.0-dev \
  libjpeg-dev \
  libgif-dev \
  librsvg2-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN yarn install --production --pure-lockfile --ignore-engines && \
    yarn add sharp --ignore-engines && \
    yarn cache clean

CMD ["yarn", "start"]
