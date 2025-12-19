#!/bin/bash
# 简洁版手动安装 VS Code Server（WSL / Remote-SSH）

COMMIT_ID="994fd12f8d3a5aa16f17d42c041e5809167e845a"
VSCODE_DIR="$HOME/.vscode-server/bin/$COMMIT_ID"
TMP_TAR="/tmp/vscode-server.tar.gz"

# 删除旧安装和锁
rm -rf "$VSCODE_DIR"
rm -f "$HOME/.vscode-server/.lock"

# 创建目录
mkdir -p "$VSCODE_DIR"

# 下载 VS Code Server（走 wget 已设置的代理）
wget -O "$TMP_TAR" "https://update.code.visualstudio.com/commit:$COMMIT_ID/server-linux-x64/stable"

# 解压到安装目录
tar -xzf "$TMP_TAR" -C "$VSCODE_DIR" --strip-components=1

# 删除临时文件
rm "$TMP_TAR"

# 显示安装目录
ls "$VSCODE_DIR"
