# Mac Clipboard to Markdown 😊

Two Mac Automator tools, primarily using Apple Script and keyboard shortcuts, to save clipboard content to Obsidian or other Markdown note-taking applications.

## Scripts

### 1. work-record.applescript

**Function**: Append clipboard content to `Work record.md`, inserting at line 9 (preserving YAML frontmatter).

**Features**:
- Auto-adds timestamp (format: 2026-02-05 10:30:00)
- Creates reverse chronological timeline (newest on top)
- UTF-8 encoding protection for non-ASCII characters
- Auto-creates file with frontmatter template if not exists

**Use case**: Quick capture of work snippets and temporary notes.

---

### 2. brain-dump.applescript

**Function**: Interactive version with dialog boxes, saves to `brain dump/` folder.

**Features**:
- Custom filename (optional, defaults to timestamp)
- Multiple tags support
- Optional description field
- Auto-generates YAML frontmatter

**Use case**: Categorized notes with metadata.

---

## Setup

### Step 1: Configure Scripts

1. Edit file paths in scripts:
   - `work-record.applescript`: modify `filePath` variable
   - `brain-dump.applescript`: modify `folderPath` variable

2. Save scripts locally (e.g., `~/Scripts/`)

### Step 2: Create Automator Service

1. Open Mac Automator app
2. File → New → Choose "Quick Action"
3. Configure at the top:
   - **Workflow receives**: select "no input"
   - **In**: select "any application"
4. Find "Run AppleScript" on the left, drag to right workspace
5. Delete default code, paste script content
6. Save (e.g., "Save to Work Record")

### Step 3: Set Keyboard Shortcut

1. Open System Settings → Keyboard → Keyboard Shortcuts
2. Select "Services" on the left, scroll to "General" on the right
3. Find your saved Quick Action name (expand "General" if needed)
4. Click "none" or the shortcut area, press your key combination
5. Close settings, shortcut takes effect immediately

---

## Troubleshooting

### 1. Shortcut not working in Spotlight (Cmd+Space)

**Cause**: Spotlight search box is a system modal window that blocks global shortcuts.

**Fix**: Press Esc to exit Spotlight, then use the shortcut.

---

### 2. `Operation not permitted` error in Terminal

Error example:
```
cat: /Users/.../Work record.md: Operation not permitted
```

**Cause**: macOS "Full Disk Access" restrictions. Terminal (or Automator) lacks permission to access Documents/Downloads folders.

**Fix**:
1. Open System Settings → Privacy & Security → Full Disk Access
2. Click lock icon to unlock
3. Add "Terminal" and "Automator" apps
4. Restart both apps

Or place notes in locations without special restrictions (e.g., `~/Notes/`).

---

### 3. Shortcut not working in some apps

**Possible causes**:
- **Shortcut conflict**: `Ctrl+Cmd+A/I/N` may be used by system or other apps
  - `Cmd+A` = Select All
  - `Cmd+I` = Italic
  - `Cmd+N` = New

**Suggestion**: Choose uncommon combinations. Check System Settings → Keyboard → Keyboard Shortcuts for occupied shortcuts.

**Another cause**: Some contexts (Spotlight, screensaver, login window) block global shortcuts.

---

## Notes

- **Encoding**: Scripts include `export LANG=en_US.UTF-8` to prevent encoding issues
- **Path**: Ensure paths exist and apps have access permissions
- **Permissions**: First run may require granting Automator file access

---

## License

MIT License - see [LICENSE](LICENSE) file
