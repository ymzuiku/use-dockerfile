# 利用 Dockerfile 部署

## 部署 & 更新

```bash
bash compose.sh
```

## node 服务 Dockerfile example

```dockerfile
FROM node
WORKDIR /usr/src/app
COPY img ./
EXPOSE 3900
RUN yarn install && yarn run build
CMD ["node", "dist/index.js"]
```
