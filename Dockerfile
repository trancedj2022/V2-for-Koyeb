# 使用 Node.js 基础镜像
FROM node:latest

# 设置工作目录
WORKDIR /app

# 复制文件到工作目录
COPY files/* /app/

# 安装必要的工具
RUN apt-get update && \
    apt-get install -y curl iproute2 && \
    npm install && \
    npm install -g pm2 && \
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb && \
    dpkg -i cloudflared.deb && \
    rm -f cloudflared.deb && \
    chmod +x web.js

# 暴露端口
EXPOSE 3000

# 设置容器启动命令
ENTRYPOINT ["node", "server.js"]
