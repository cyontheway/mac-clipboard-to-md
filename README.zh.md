# Mac 剪贴板保存到 Markdown

两款 macOS Automator 工具，使用 AppleScript 和快捷键将剪贴板内容保存至 Markdown 笔记。

---

## 脚本说明

### 1. work-record.applescript

**功能**：将剪贴板内容追加到 `Work record.md`，自动插入到 YAML frontmatter 之后。

**特点**：
- 自动添加时间戳（格式：2026-02-05 10:30:00）
- 倒序时间线（新内容在最上面）
- 动态定位 frontmatter 结束位置，不受行数变化影响
- UTF-8 编码保护，中文不乱码
- 文件不存在时自动创建带 frontmatter 的模板
- 无 frontmatter 的文件也兼容

**适用场景**：快速记录工作中的零散信息、临时笔记。

### 2. brain-dump.applescript

**功能**：带交互对话框，保存到 `brain dump/` 文件夹。

**特点**：
- 自定义文件名（可选，默认使用时间戳）
- 多标签支持
- 可选描述字段
- 自动生成 YAML frontmatter

**适用场景**：需要分类归档的内容、带标签的笔记。

---

## 安装方法

### 方式一：自动安装（推荐）

```bash
# 安装 work-record（修改路径为你想要的）
python3 scripts/install.py --tool work-record --path "~/Documents/Work record.md"

# 安装 brain-dump
python3 scripts/install.py --tool brain-dump --path "~/Documents/brain dump/"

# 两个一起装
python3 scripts/install.py --tool all --work-record-path "~/Documents/Work record.md" --brain-dump-path "~/Documents/brain dump/"
```

会自动创建 `.workflow` 包到 `~/Library/Services/`，刷新 Finder 后即可在「系统设置 → 键盘 → 键盘快捷键 → 服务」中绑定快捷键。

### 方式二：手动安装

#### 第一步：修改脚本路径

修改 `work-record.applescript` 中的 `filePath` 和 `brain-dump.applescript` 中的 `folderPath` 为你的实际路径。

#### 第二步：创建 Automator 快速操作

1. 打开「自动操作」App（Automator）
2. 文件 → 新建 → 选择「快速操作」
3. 顶部设置：
   - **工作流程收到**：选择「没有输入」
   - **位于**：选择「任何应用程序」
4. 左侧找到「运行 AppleScript」，拖到右侧工作区
5. 删除默认代码，粘贴对应脚本内容
6. 保存（work-record 保存为「保存到 Work Record」，brain-dump 保存为「Brain Dump」）

#### 第三步：设置快捷键

1. 打开「系统设置」→「键盘」→「键盘快捷键」
2. 左侧选「服务」，右侧滚动到「通用」
3. 找到刚保存的快速操作名称，点击右侧空白区域按下快捷键

推荐：work-record → `Ctrl+Cmd+Shift+V`，brain-dump → `Ctrl+Opt+Cmd+V`

### 方式三：AI 辅助安装

如果你使用 Claude Code，可直接触发 skill 交互式安装：

```
/剪贴板转笔记
```

或说出触发词（如「安装剪贴板工具」「设置 brain dump」），AI 会通过问答引导你完成安装。

---

## 目录结构

```
mac-clipboard-to-md/
├── SKILL.md                   ← AI 辅助安装向导（Claude Code 专用）
├── scripts/
│   └── install.py             ← 自动安装器
├── work-record.applescript    ← 静默模式脚本模板
├── brain-dump.applescript     ← 交互模式脚本模板
├── README.md                  ← 项目说明（中英入口）
├── README.zh.md               ← 中文详细说明
├── README.en.md               ← English documentation
└── LICENSE                    ← MIT 许可证
```

---

## 常见问题

### 1. 快捷键在某些应用里不生效

**原因**：快捷键冲突或系统模态窗口拦截。

**解决**：选择不常用的组合（如 `Ctrl+Cmd+Shift+V`），避免 `Cmd+C/V/A` 等常用键。Spotlight 等模态窗口需先退出。

### 2. 报错 `Operation not permitted`

**原因**：macOS「完全磁盘访问权限」限制。

**解决**：
1. 打开「系统设置」→「隐私与安全性」→「完全磁盘访问权限」
2. 解锁后添加「自动操作」（Automator.app）
3. 重启 Automator

### 3. 中文乱码

脚本已内置 `export LANG=en_US.UTF-8`，如仍有乱码请检查系统 locale 设置。

---

## License

MIT License — 详见 [LICENSE](LICENSE) 文件
