FROM node:26-slim

# Node 26 images no longer include corepack. pnpm is required by the project.
RUN apt-get update && apt-get install -y --no-install-recommends \
      make python3 g++ \
  && rm -rf /var/lib/apt/lists/* \
  && npm install -g pnpm@11.20.0

WORKDIR /app

COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm run build

CMD ["make", "test"]
