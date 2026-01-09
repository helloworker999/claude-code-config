# Claude Code 配置集合

一套自定义斜杠命令、提示词模板和配置，用于增强你的 Claude Code 使用体验。

## 功能特性

### 自定义斜杠命令

#### `/c-drawio` - 流程图生成器
分析代码逻辑并自动生成专业的 draw.io 流程图。

**使用方法：**
```bash
/c-drawio [要分析的代码/文件/逻辑]
```

**功能特点：**
- 分析代码逻辑和控制流
- 生成具有适当形状和颜色的专业流程图
- 支持决策点、循环和数据流
- 将图表保存到 `.claude/` 目录
- 中文输出

**示例：**
```bash
/c-drawio com.fenqile.ms.reward.service.reward.RewardUserService#queryUserRewardRecord

```

#### `/c-logic` - 接口文档生成器
分析 API 端点和接口，生成全面的文档。

**使用方法：**
```bash
/c-logic [要分析的接口/API端点]
```

**功能特点：**
- 追踪从入口到响应的完整逻辑流程
- 记录请求/响应结构
- 识别依赖关系和数据库操作
- 包含错误处理和业务规则
- 将文档保存到 `~/studio/code/claude-doc/[项目名]/`
- 中文输出

**示例：**
```bash
/c-logic com.fenqile.ms.reward.service.reward.RewardUserService#queryUserRewardRecord

```

### 提示词模板

#### Draw.io 图表生成规范
用于生成 draw.io XML 图表的综合规范，包含以下最佳实践：
- 布局约束和页面边界
- 形状类型和样式
- 连接器样式和动画
- XML 结构和验证规则

位置：`prompt/drawio/drawio.md`

## 安装

### 快速安装

#### Linux / macOS

运行安装脚本将所有配置复制到你的 Claude Code 目录：

```bash
./install.sh
```

#### Windows

**方式 1：使用 PowerShell（推荐）**
```powershell
powershell -ExecutionPolicy Bypass -File install.ps1
```

**方式 2：使用批处理脚本**
```cmd
install.bat
```

安装脚本将会：
- 创建 `~/.claude/commands/` 和 `~/.claude/prompt/` 目录（Windows: `%USERPROFILE%\.claude\`）
- 复制所有自定义斜杠命令
- 复制所有提示词模板
- 保留目录结构

### 手动安装

#### Linux / macOS

```bash
# 创建目录
mkdir -p ~/.claude/commands
mkdir -p ~/.claude/prompt

# 复制命令
cp commands/*.md ~/.claude/commands/

# 复制提示词
cp -r prompt/* ~/.claude/prompt/
```

#### Windows (PowerShell)

```powershell
# 创建目录
New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude\commands" -Force
New-Item -ItemType Directory -Path "$env:USERPROFILE\.claude\prompt" -Force

# 复制命令
Copy-Item -Path "commands\*.md" -Destination "$env:USERPROFILE\.claude\commands\" -Exclude "README.md"

# 复制提示词
Copy-Item -Path "prompt\*" -Destination "$env:USERPROFILE\.claude\prompt\" -Recurse -Force
```

### 安装后

安装完成后，重启 Claude Code 或重新加载配置以使用新命令。

## 项目结构

```
claude-code-config/
├── commands/           # 自定义斜杠命令
│   ├── c-drawio.md    # 流程图生成器命令
│   └── c-logic.md     # 接口文档生成命令
├── prompt/            # 提示词模板和规范
│   └── drawio/
│       └── drawio.md  # Draw.io 生成规范
├── skill/             # 自定义技能（未来）
├── mcp/               # MCP 服务器配置（未来）
├── install.sh         # Linux/macOS 安装脚本
├── install.ps1        # Windows PowerShell 安装脚本
├── install.bat        # Windows 批处理安装脚本
├── CHANGELOG.md       # 更新日志
├── LICENSE            # 许可证文件
└── README.md          # 本文件
```

## 使用示例

### 生成流程图

```bash
# 分析文件并生成流程图
/c-drawio com.fenqile.ms.reward.service.reward.RewardUserService#queryUserRewardRecord

```

流程图将保存到 `.claude/[描述性名称].drawio`

### 生成文档

```bash
# 分析 Java 类方法
/c-logic com.fenqile.ms.reward.service.reward.RewardUserService#queryUserRewardRecord

```

文档将保存到 `~/studio/code/claude-doc/[项目名]/[接口名].md`

## 自定义

### 修改命令

编辑 `commands/` 中的命令文件以自定义行为：
- 更改输出语言
- 修改保存位置
- 调整格式偏好
- 添加新功能

### 添加提示词模板

将新的提示词模板添加到 `prompt/` 目录。在命令中使用以下方式引用：
```markdown
@prompt/your-template/template.md
```

## 贡献

添加你自己的自定义命令：

1. 在 `commands/` 目录中创建一个新的 `.md` 文件
2. 遵循带有前置元数据的命令格式：
   ```markdown
   ---
   description: 命令的简要描述
   argument-hint: [参数提示]
   ---

   # Task: 命令名称

   [命令说明...]
   ```
3. 运行安装脚本安装新命令
4. 在 Claude Code 中测试你的命令

## 许可证

详见 [LICENSE](LICENSE) 文件。

## 更新日志

详见 [CHANGELOG.md](CHANGELOG.md) 文件。
