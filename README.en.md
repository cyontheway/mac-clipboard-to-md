# Mac Clipboard to Markdown

Two macOS Automator tools using AppleScript and keyboard shortcuts to save clipboard content to Markdown notes.

---

## Scripts

### 1. work-record.applescript

**Function**: Append clipboard content to `Work record.md`, inserting after YAML frontmatter.

**Features**:
- Auto timestamp (format: 2026-02-05 10:30:00)
- Reverse chronological order (newest on top)
- Dynamic frontmatter detection
- UTF-8 encoding protection
- Auto-creates file with frontmatter template if missing
- Graceful fallback for files without frontmatter

**Use case**: Quick capture of work snippets and temporary notes.

### 2. brain-dump.applescript

**Function**: Interactive dialog version, saves to `brain dump/` folder.

**Features**:
- Custom filename (optional, defaults to timestamp)
- Multiple tags support
- Optional description
- Auto-generated YAML frontmatter

**Use case**: Categorized notes with metadata.

---

## Installation

### Method 1: Automated (Recommended)

```bash
# Install work-record
python3 scripts/install.py --tool work-record --path "~/Documents/Work record.md"

# Install brain-dump
python3 scripts/install.py --tool brain-dump --path "~/Documents/brain dump/"

# Install both
python3 scripts/install.py --tool all --work-record-path "~/Documents/Work record.md" --brain-dump-path "~/Documents/brain dump/"
```

Creates `.workflow` bundles in `~/Library/Services/` and refreshes Finder. Then bind a shortcut in System Settings → Keyboard → Keyboard Shortcuts → Services.

### Method 2: Manual Setup

1. Edit the path variables in the `.applescript` files
2. Open Automator → New → Quick Action (no input, any application)
3. Drag "Run AppleScript", paste script content, save
4. Bind shortcut in System Settings → Keyboard → Keyboard Shortcuts → Services

### Method 3: AI-Assisted

If using Claude Code, trigger the SKILL.md interaction:

```
/clipboard-to-markdown
```

Or say trigger phrases like "install clipboard tool" to start the guided setup.

---

## Project Structure

```
mac-clipboard-to-md/
├── SKILL.md                   ← AI-assisted install wizard (Claude Code)
├── scripts/
│   └── install.py             ← Automated installer
├── work-record.applescript    ← Silent mode script
├── brain-dump.applescript     ← Interactive mode script
├── README.md / .zh.md / .en.md
└── LICENSE
```

---

## Troubleshooting

### Shortcut not working in some apps

**Cause**: Conflicts or system modal windows.

**Fix**: Use uncommon shortcuts like `Ctrl+Cmd+Shift+V`. Exit Spotlight/spacesaver before using.

### `Operation not permitted`

**Cause**: macOS Full Disk Access restrictions.

**Fix**: Add Automator.app in System Settings → Privacy & Security → Full Disk Access, then restart Automator.

### Encoding issues

Scripts include `export LANG=en_US.UTF-8`. Check system locale if issues persist.

---

## License

MIT License — see [LICENSE](LICENSE) file
