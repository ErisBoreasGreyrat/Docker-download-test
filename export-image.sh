#!/bin/bash

# Docker 镜像导出脚本
# 将 httpd:2.4 镜像从 docker.1ms.run 源拉取并导出为 .tar 文件

IMAGE="docker.1ms.run/amd64/httpd:2.4"
OUTPUT_FILE="httpd-2.4.tar"

echo "=========================================="
echo "Docker 镜像导出工具"
echo "=========================================="
echo ""

# 步骤 1：拉取镜像
echo "[步骤 1/3] 开始拉取镜像: $IMAGE"
docker pull "$IMAGE"

if [ $? -ne 0 ]; then
    echo "❌ 镜像拉取失败！"
    exit 1
fi
echo "✅ 镜像拉取成功"
echo ""

# 步骤 2：显示镜像信息
echo "[步骤 2/3] 显示镜像信息："
docker images | grep httpd
echo ""

# 步骤 3：导出镜像为 tar 文件
echo "[步骤 3/3] 导出镜像为 .tar 文件: $OUTPUT_FILE"
docker save -o "$OUTPUT_FILE" "$IMAGE"

if [ $? -eq 0 ]; then
    echo "✅ 镜像导出成功！"
    echo ""
    echo "文件信息："
    ls -lh "$OUTPUT_FILE"
    echo ""
    echo "文件路径: $(pwd)/$OUTPUT_FILE"
    echo ""
    echo "导入镜像命令 (在其他机器上使用):"
    echo "  docker load -i $OUTPUT_FILE"
else
    echo "❌ 镜像导出失败！"
    exit 1
fi
