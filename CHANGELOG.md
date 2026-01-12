# 更新日志

本文档记录了 Claude Code 配置集合的所有重要变更。

## [v1.1.0] - 2026-01-12

### 新增
- 添加 `cmd/` 目录用于存放实用命令脚本
- 添加 `cc-serena` 命令脚本
  - 自动为项目配置 Serena MCP 服务器
  - 支持指定项目目录或使用当前目录
  - 自动从 GitHub 安装最新版本的 Serena
  - 配置完成后自动启动 Claude Code

### 文档
- 创建 `cmd/readme.md` 文档
  - 详细说明 cc-serena 命令的使用方法
  - 包含参数说明、工作流程和依赖项信息

### 改进
- 更新 `install.sh` 安装脚本

## [v1.0.0] - 2026-01-09

### 新增
- 添加 `/c-drawio` 流程图生成器命令
  - 支持分析代码逻辑并生成专业的 draw.io 流程图
  - 支持决策点、循环和数据流的可视化
  - 中文输出

- 添加 `/c-logic` 接口文档生成命令
  - 支持分析 API 端点和接口
  - 追踪完整逻辑流程
  - 记录请求/响应结构、依赖关系和数据库操作
  - 中文输出

- 添加 draw.io 图表生成规范
  - 完整的 XML 结构规范
  - 布局约束和最佳实践
  - 形状类型和样式指南

- 添加跨平台安装脚本
  - Linux/macOS: `install.sh`
  - Windows PowerShell: `install.ps1`
  - Windows 批处理: `install.bat`

### 文档
- 创建中文 README.md
- 添加详细的安装说明（支持 Linux/macOS/Windows）
- 添加使用示例和命令说明
- 添加项目结构说明

### 初始发布
- 项目初始化
- 基础目录结构搭建
