# Mac Clipboard to Markdown

[中文](./README.zh.md) | [English](./README.en.md)

Quickly save Mac clipboard content to Markdown notes using AppleScript and Automator.

快速使用 AppleScript 和自动操作将 Mac 剪贴板内容保存到 Markdown 笔记。

---

## 简介 | Overview

两个 AppleScript 脚本，通过 macOS「自动操作」快速保存剪贴板内容到 Markdown 笔记。

Two AppleScript tools to quickly save clipboard content to Markdown notes using macOS Automator.

### 安装方式 | Installation

| 方式 | 说明 |
|------|------|
| **自动安装** | 运行 `scripts/install.py`，自动创建 workflow |
| **手动安装** | 按 [中文文档](./README.zh.md) 步骤手动创建 Automator 快速操作 |
| **AI 辅助** | 配合 Claude Code 的 [SKILL.md](./SKILL.md) 交互式引导 |

---

## 目录结构 | Structure

```
mac-clipboard-to-md/
├── SKILL.md                   ← AI 辅助安装向导
├── scripts/
│   └── install.py             ← 自动安装器
├── work-record.applescript    ← 静默模式脚本
├── brain-dump.applescript     ← 交互模式脚本
├── README.md / .zh.md / .en.md
└── LICENSE
```

---

## 语言版本 | Language Versions

- **[中文文档](./README.zh.md)** — 完整的中文使用说明
- **[English Documentation](./README.en.md)** — Complete English instructions

---

## License

MIT License — see [LICENSE](./LICENSE) file
