FROM node:20-bullseye
WORKDIR /workspace
ENV TZ=Asia/Shanghai
RUN npm install -g pnpm@9
RUN apt-get update && apt-get install -y git ca-certificates && rm -rf /var/lib/apt/lists/*
CMD ["cat"]

