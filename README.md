# Docker 镜像拉取测试

这个仓库用于测试从自定义 Docker 源拉取镜像。

## 镜像信息

- **镜像源**：`docker.1ms.run/amd64/httpd:2.4`
- **镜像名称**：httpd
- **版本**：2.4
- **架构**：amd64

## 使用方法

### 方式 1：直接拉取镜像

```bash
docker pull docker.1ms.run/amd64/httpd:2.4
```

### 方式 2：使用脚本拉取

```bash
chmod +x docker-pull.sh
./docker-pull.sh
```

### 方式 3：使用 Dockerfile 构建

```bash
docker build -t httpd:2.4-custom .
```

## 运行容器

```bash
docker run -d -p 80:80 docker.1ms.run/amd64/httpd:2.4
```

## 验证

查看已拉取的镜像：

```bash
docker images | grep httpd
```

## 说明

- `Dockerfile`：基于指定镜像源的 Dockerfile 配置
- `docker-pull.sh`：自动化拉取脚本，包含错误处理
- 本仓库存储了镜像拉取的配置和脚本
