# 命令说明

本目录包含用于配置和管理 Claude Code 的实用命令脚本。

## cc-serena

为指定项目配置 Serena MCP 服务器并启动 Claude Code。

### 功能

- 自动为项目添加 Serena MCP 服务器配置
- 使用 uvx 从 GitHub 仓库安装最新版本的 Serena
- 配置 Serena 以 claude-code 上下文模式运行
- 启动 Claude Code 并切换到项目目录

### 使用方法

```bash
# 为当前目录配置 Serena
./cc-serena

# 为指定目录配置 Serena
./cc-serena /path/to/project
```

### 参数

- `PROJECT_DIR` (可选): 项目目录路径，默认为当前工作目录

### 工作流程

1. 解析项目目录路径（使用参数或当前目录）
2. 通过 `claude mcp add` 命令添加 Serena MCP 服务器
3. 使用 uvx 从 GitHub 安装 Serena
4. 配置 Serena 以 claude-code 上下文模式启动
5. 切换到项目目录并启动 Claude Code

### 依赖

- Claude Code CLI
- uvx (Python 包管理工具)
- Git (用于从 GitHub 克隆 Serena)

### 注意事项

- 确保已安装 Claude Code CLI
- 脚本会自动处理 Serena 的安装和配置
- 每次运行都会重新配置 MCP 服务器
