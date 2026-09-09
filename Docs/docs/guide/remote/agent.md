# AI Agent 控制

把设备交给 AI 客户端操作：启用 Agent 并生成 API Key 后，OpenClaw、Claude Code、Codex、DSH 等 AI 客户端可以通过 **Skill** 或 **MCP** 两种方式控制键鼠、截屏，适合自动化巡检、批量配置、无人值守操作等场景。

## 开启 Agent

进设置 → **Agent**。

!!! note "截图占位"

    待补充：设置 → Agent 页面截图（`images/agent/setting_agent.webp`）。

| 操作 | 说明 |
|------|------|
| 启用 Agent | 开启后 AI 客户端才能调用接口 |
| 生成 | 生成 `sk-` 开头的 API Key，作为调用凭据 |
| 复制 | 复制当前 API Key |
| 删除 | 作废当前 API Key，已发放的 Key 立即失效 |

> API Key 等同于键鼠控制权限，只配置给可信的 AI 客户端。泄露后立即删除并重新生成。Skill 与 MCP 两种方式使用同一个 API Key。

## 两种接入方式

Agent 支持 Skill 和 MCP 两种调用方式，最终都是让 AI 客户端拿到"截屏 + 控制键鼠"的能力，任选一种即可，也可同时使用：

| 方式 | 是什么 | 适合的客户端 |
|------|------|-------------|
| **Skill**（推荐） | 一个"操作说明书"文件夹：放进客户端的技能目录，AI 读完就知道怎么调用设备接口 | OpenClaw、Claude Code、Codex 等支持 Agent Skills 的客户端 |
| **MCP** | 设备内置的标准工具接口：在客户端里登记一次网址和密钥，截图、点击等工具自动出现 | Claude Code、Codex、DSH 等支持 MCP 的客户端 |

- **Skill**：仓库里自带执行规则、事件参考、示例和排错说明，AI"照着说明书"操作。
- **MCP**：行业标准协议（Model Context Protocol），适合已经在用 MCP 管理工具的环境。

## 方式一：Skill（flexkvm-skill）

官方技能仓库：<https://github.com/chutuotek/flexkvm-skill>

### 1. 安装技能

把仓库克隆到客户端的技能目录（通用做法，目录名保持 `flexkvm-skill`）：

=== "OpenClaw"

    ```bash
    git clone https://github.com/chutuotek/flexkvm-skill.git \
      ~/.openclaw/workspace/skills/flexkvm-skill
    ```

=== "Claude Code"

    ```bash
    git clone https://github.com/chutuotek/flexkvm-skill.git \
      ~/.claude/skills/flexkvm-skill
    ```

=== "Codex"

    ```bash
    git clone https://github.com/chutuotek/flexkvm-skill.git \
      ~/.codex/skills/flexkvm-skill
    ```

### 2. 配置环境变量

技能从环境变量读取设备地址和凭据，两个变量都必填：

| 变量 | 说明 |
|------|------|
| `FlexKVM_IP` | 设备 IP 地址 |
| `FlexKVM_TOKEN` | 设置 → Agent 生成的 API Key |

```bash
# Bash
export FlexKVM_IP="192.168.x.x"
export FlexKVM_TOKEN="sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

```powershell
# PowerShell（写入用户级环境变量，永久生效）
[System.Environment]::SetEnvironmentVariable("FlexKVM_IP", "192.168.x.x", "User")
[System.Environment]::SetEnvironmentVariable("FlexKVM_TOKEN", "sk-xxxx...", "User")
```

> 修改环境变量后，重启客户端或重开终端再执行。

### 3. 使用

直接对 AI 说人话：

```text
看一下目标机现在的屏幕
打开记事本，输入 hello，保存到桌面
把桌面上的 setup.exe 装上，过程中截图给我确认
```

技能包含截图、点击/拖拽/滚动、文本输入、快捷键等完整能力与最佳实践（先截图确认状态再操作、长文本同步输入、`release_all` 兜底释放等），细节见仓库内的 `SKILL.md` 与 `README.zh-cn.md`。

## 方式二：MCP 端点

设备内置 MCP 服务端，把截屏、键鼠控制做成一组标准"工具"。配置只需要三样东西：网址、密钥、传输类型：

| 配置项 | 值 |
|--------|------|
| 类型 | Streamable HTTP（MCP 的标准联网方式） |
| URL | `https://<设备地址>/api/v1/mcp` |
| 认证 | `Authorization: Bearer <API Key>` |

可用工具：`state`（状态）、`screenshot`（截屏）、`type_text`（输入文本）、`press_key`（按键）、`mouse_move` / `mouse_click` / `mouse_scroll` / `mouse_drag`（鼠标）、`mouse_down` / `mouse_up` / `key_down` / `key_up` / `release_all`（按住类）、`control`（事件批次）。工具列表建议客户端通过 `tools/list` 动态获取。

=== "Claude Code"

    ```bash
    claude mcp add --transport http flexkvm \
      https://<设备地址>/api/v1/mcp \
      --header "Authorization: Bearer <API Key>"
    ```

    加 `--scope user` 可全局生效（所有项目可用）。用 `claude mcp list` 验证连接状态。

=== "Codex"

    编辑 `~/.codex/config.toml`（需 Codex CLI ≥ 0.44，支持 Streamable HTTP）：

    ```toml
    [mcp_servers.flexkvm]
    url = "https://<设备地址>/api/v1/mcp"
    bearer_token_env_var = "FlexKVM_TOKEN"
    ```

    并设置环境变量：

    ```bash
    export FlexKVM_TOKEN="sk-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    ```

=== "DSH"

    在 profile 的 `cordis.patch.yml`（或启动时 `--patch` 指定的文件）中添加 `dsh-mcp-client` 插件实例：

    ```yaml
    - id: mcp-flexkvm
      name: '@deepseek-ai/dsh-mcp-client'
      config:
        serverName: flexkvm
        transport: streamable-http
        url: https://<设备地址>/api/v1/mcp
        headers:
          Authorization: !!js '`Bearer ${process.env.FlexKVM_TOKEN}`'
    ```

    工具以 `mcp__flexkvm__<工具名>` 的名字暴露给智能体。

=== "其他 MCP 客户端"

    任何支持 Streamable HTTP 传输、可自定义请求头的 MCP 客户端都能接入，按上面"配置项"表填写 URL 与认证头即可。密钥建议走环境变量，避免明文写入配置文件。

!!! note "截图占位"

    待补充：Claude Code `claude mcp list` 显示 flexkvm 已连接的截图（`images/agent/mcp_list.webp`）。

## HTTPS 证书提示

设备默认使用自签名 HTTPS 证书。客户端报 TLS / `self-signed certificate` 错误时，在客户端所在机器导入设备 CA 证书并设为信任即可（设置 → 系统 → HTTPS 配置 → 下载 CA 证书），详见 [HTTPS 证书](../security/https.md)。临时调试可用 `curl -k` 跳过校验（flexkvm-skill 的脚本已内置）。

## 与用户协同

| Agent 开关 | 用户在线 | 行为 |
|:---:|:---:|------|
| 关闭 | 任意 | AI 无法控制 |
| 开启 | 无 | AI 操作即时生效 |
| 开启 | 有 | AI 与用户共用同一套键鼠 |

- AI 与在线用户共用同一 HID 设备，两边同时操作会互相干扰，建议错开使用。
- Agent 开启且用户不在线时，设备保持一条随时可截屏的画面通道。
- 配网模式下 Agent 接口整体关闭。

---

## 常见问题

**调用返回 401？** → API Key 缺失或不匹配。删除过 Key？重新生成并更新客户端配置。

**调用返回 403？** → Agent 未启用，到设置 → Agent 打开开关。

**Skill 安装后 AI 说没有这个能力？** → 确认仓库放在客户端的技能目录下、目录内有 `SKILL.md`，然后重启客户端；OpenClaw 可用 `openclaw skills list` 检查。

**MCP 配置后工具没出现？** → Claude Code 用 `claude mcp list` 查看状态；DSH 检查 patch 文件加载与 `serverName` 是否改动过；两者都失败先看下一条 TLS 报错。

**连接报 TLS / 证书错误？** → 设备是自签名证书，把设备 CA 导入系统信任（见上文"HTTPS 证书提示"）。

**AI 操作没反应？** → 事件批次总时长超过 60 秒会超时停止；确认被控主机键鼠工作正常（如 BIOS 界面可正常输入）。

---

[:octicons-arrow-left-24: 返回用户指南](../index.md)
