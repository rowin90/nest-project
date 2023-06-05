# nest demo 项目
1. 包含了 guard middleware filter decorator interceptor 基础写法
2. 代码用 nest-cli 生成，如新增 guard，使用 nest g guard xxx 。可以使用 nest g -h 看可以帮助文档

# 构建
1. docker构建。在本地用  docker build -t nest:first . 
- 打镜像 nest
- 标签 first 
- . 目录是当前

2. 启动，用 docker desktop 直接找到镜像，启动容器
3. 或者用命令行 docker run -p 3000:3000 -d --name nest:first nest-project
