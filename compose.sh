#!/bin/bash

# 清空历史
rm -rf gits || echo ""

# 拉取业务代码，忽略历史
git clone https://github.com.cnpmjs.org/ymzuiku/dockerfile-test-server-a.git gits/server-a --depth 1
git clone https://github.com.cnpmjs.org/ymzuiku/dockerfile-test-server-b.git gits/server-b --depth 1

# 预先下载公共镜像，减少镜像编译时间
docker pull node

# 启动镜像 a
cd gits/server-a
docker build -t server-a .
docker rm -f server-a || echo "" # 假定有历史镜像，先移除
docker run -p 0.0.0.0:4100:3900 --name server-a -d server-a

# 启动镜像 b
cd ../server-b
docker build -t server-b .
docker rm -f server-b || echo ""
docker run -p 0.0.0.0:4101:3900 --name server-b -d server-b

# 回归执行时路径
cd ../../