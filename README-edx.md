# Welcome to WXL: Windows Experience on Linux.

WXL is here to rescue the poor souls forced to endure raw, unforgiving Linux.
No more typing paths. No more memorizing commands. No more suffering.
Just pure joy while you watch others wrestle with Bash, vim, emacs, ed, nano and friends.


# edx

A truecolor text editor for the terminal, with the keys you already know
from Windows editors. No modes, no commands to learn: `Ctrl+S` saves,
`Ctrl+C` copies, `Ctrl+Z` undoes, `Shift+arrows` select.

It is also the viewer and editor behind ccx: `F3` and `F4` in a ccx panel
open the file in edx.

Linux has some respectable editors — gedit, Sublime Text and VS Code, to name
a few — but none of them runs in a terminal (TUI), and their workflow leans on
the mouse.

Features

- easy QUIT: ctrl+q, or Esc twice
- **F1** shows every key; **F10** opens the menu.
- Tabs: open several files at once, one tab each.
- Everything works from the keyboard. The mouse is optional but fully
      supported: click, drag to select, double-click for a word, wheel to
      scroll, middle-drag to pan, right-click to copy the selection (or to
      paste when nothing is selected).
- Several carets at once: type, delete and paste on many lines together.
- Search as you type, with case, whole-word, `\n`/`\t` escapes and regex.
	Past searches are listed as you type.
- Search and replace, in the whole file or only in the selection.
- Word completion from the open file and from word lists.
- Syntax highlighting for most languages.
- The other matches of the word under the caret light up, so you see where
	else it is used.
- For C and C++: go to a definition, function signatures and member lists,
	and errors marked while you type (needs clangd, see below).
- Line markers, bracket matching, move lines up and down.
- Compare your changes with the last git commit, side by side.
- 24-bit color and animations.

## Install

You need two files from the release folder:

- `edx.tar.gz` — the program and its installer
- `extract.sh` — unpacks the tarball and runs the installer

Put both in one directory on the target machine, then run:

```sh
sh extract.sh
```

It works on any Linux with glibc 2.28 or newer (any distro from 2018 on).
Use `sh extract.sh`, not `./extract.sh`: the file may have lost its exec bit
on the way over, and `sh` does not need it.

What it installs:

- the `edx` binary into `~/.local/bin`
- `cppdoc` next to it — the C/C++ lookup tool behind `F4`; it is the same
  program under a second name
- the word lists for completion into `~/.config/edx/words/`
- a PATH block in `~/.local/share/dev-wxl.sh`

At the end it prints one line. Add it at the **end** of your `~/.bashrc`, so
`~/.local/bin` is on your PATH:

```sh
. "$HOME/.local/share/dev-wxl.sh"
```

Nothing writes `~/.bashrc` for you. Adding that line is your step.

Installer options (pass them to `extract.sh`):

| Option           | What it does                                               |
|------------------|------------------------------------------------------------|
| `--prefix DIR`   | put the binary in `DIR` instead of `~/.local/bin`          |
| `--system`       | install for every user (needs `sudo`), see below           |
| `--no-install`   | only unpack, do not install                                |

**For every user:** `sudo sh extract.sh --system`. The binary goes to
`/usr/local/bin`, the word lists to `/usr/local/share/wxl/edx/words/`, and
one block goes into `/etc/bash.bashrc`, so no user has to edit anything. A
user's own install still wins over the system one.

**Uninstall:**

```sh
sh ~/.local/share/wxl/uninstall.sh edx
sudo sh /usr/local/share/wxl/uninstall.sh edx     # a --system install
```

It removes only the files the installer wrote, and only if nobody changed
them since.

**For the C/C++ features** you also need `clangd`, which the installer
cannot supply. Install it from your distro, e.g.
`sudo apt-get install clangd`. Everything else works without it.

## Starting

```sh
edx file.txt                 # edit a file (it may not exist yet)
edx a.cpp b.h                # two files, one tab each
edx main.cpp:34              # open at line 34
edx --viewer log.txt         # read-only
```

---

# Two sets of defaults: `wt` and `x`

edx ships two sets of defaults:

- `wt` — keys that work in a stock Windows Terminal. Windows Terminal
  keeps some keys for itself, and those never reach edx. This is the
  default.
- `x` — the author's own set, made for a Linux terminal.

Pick one with the environment variable `WXL_DEFAULTS`. It works for every
WXL app at once (ccx, edx, cpx, searchx, trx, hex):

```sh
export WXL_DEFAULTS=x      # Linux: put it in ~/.bashrc
setx WXL_DEFAULTS x        # Windows: new windows get it
```

- `WXL_DEFAULTS` not set, or set to anything other than `x` or `wt`: the
  app uses `wt`.
- `--defaults x` or `--defaults wt` picks a set for one run.
- `--no-config` ignores `WXL_DEFAULTS` and uses `wt`, unless you also give
  `--defaults`.
- Your `config.json` applies on top of either set.
- The F1 sheet, `--help` and `--keys` show which set is active, and why.

The key tables below show the `x` keys. In `wt` these are different:

| What | `x` | `wt` |
|---|---|---|
| Add a caret above / below | `Alt+Shift+Up` / `Alt+Shift+Down` | `Ctrl+Alt+Up` / `Ctrl+Alt+Down` |
| Move the line up / down | `Ctrl+Shift+Up` / `Ctrl+Shift+Down` | `Alt+PgUp` / `Alt+PgDn` |
| Select to the start / end of the file | `Ctrl+Shift+Home` / `Ctrl+Shift+End` | `Ctrl+Alt+Home` / `Ctrl+Alt+End` |
| Not bound in `wt` (Windows Terminal takes them) | `Ctrl+Shift+F` for replace, `Ctrl+Insert`, `Shift+Insert` | — |

---

# Features and their default keys

Press **F1** at any time for the full list inside edx. It shows *your*
keys, not these, if you rebound anything. `edx --cheatsheet` prints it as
text.

## Files and tabs

| What                                        | Key                               |
|---------------------------------------------|-----------------------------------|
| Save (asks for a name when there is none)   | `Ctrl+S`                          |
| Open a file (a ccx-style file panel)        | `Ctrl+O`                          |
| New empty tab                               | `Ctrl+N`                          |
| Close this tab                              | `Ctrl+W`                          |
| Next / previous tab                         | `Ctrl+PgDn` / `Ctrl+PgUp`         |
| Tab 1 to 9                                  | `Alt+1` .. `Alt+9`                |
| Reload the file from disk                   | `Ctrl+R`                          |
| Quit (asks about each unsaved tab)          | `Ctrl+Q`                          |
| The menu: File / Edit / Code / View         | `F10`, or `Alt+F` / `E` / `C` / `V` |
| Open a recent file                          | File menu, then its digit         |
| Re-read `config.json` without restarting    | `Ctrl+Alt+Shift+R`                |

**Esc twice quits.** `Esc` first drops what is active: extra carets, then
the selection, then the search highlight. When nothing is left, one more
`Esc` flashes the text red and waits one second; a second `Esc` in that
time quits. Any other key cancels it.

## Moving and the view

| What                                  | Key                          |
|---------------------------------------|------------------------------|
| By word                               | `Ctrl+Left` / `Ctrl+Right`   |
| Line start / end                      | `Home` / `End`               |
| Document start / end                  | `Ctrl+Home` / `Ctrl+End`     |
| Jump to the matching bracket          | `Ctrl+]`                     |
| Scroll without moving the caret       | `Ctrl+Up` / `Ctrl+Down`, wheel |
| Wrap long lines on / off              | `Alt+W`                      |
| Big clock in the corner on / off      | `Ctrl+T`                     |

## Selecting and editing

| What                                        | Key                                    |
|---------------------------------------------|----------------------------------------|
| Select while moving                         | `Shift` + any move key                 |
| Select all                                  | `Ctrl+A`                               |
| Select with the mouse; a word / a line      | drag, double-click, triple-click       |
| Undo / redo                                 | `Ctrl+Z` / `Ctrl+Y`                    |
| Duplicate the line or selection             | `Ctrl+D`                               |
| Delete the line                             | `Ctrl+L`, `Alt+Del`                    |
| Move the line up / down                     | `Ctrl+Shift+Up` / `Ctrl+Shift+Down`    |
| Indent / dedent the selected lines          | `Tab` / `Shift+Tab`                    |
| Delete a word before / after the caret      | `Ctrl+Backspace` / `Ctrl+Del`          |
| Lowercase / uppercase the selection         | `Ctrl+U` / `Ctrl+Shift+U`              |
| Insert / overwrite mode                     | `Ins`                                  |
| Add a caret on the line above / below       | `Alt+Shift+Up` / `Alt+Shift+Down`      |

## Clipboard

| What                                     | Key                      |
|------------------------------------------|--------------------------|
| Copy (no selection: the word at the caret) | `Ctrl+C`, `Ctrl+Ins`   |
| Cut                                      | `Ctrl+X`, `Shift+Del`    |
| Paste what edx copied                    | `Ctrl+V`, `Shift+Ins`    |
| Paste from outside edx                   | your terminal's paste key, e.g. `Ctrl+Shift+V` |
| Right-click                              | copy with a selection, paste without one |

Copy also reaches the system clipboard, through your terminal.

## Search and replace

| What                                      | Key                              |
|-------------------------------------------|----------------------------------|
| Search (starts with the word at the caret) | `Ctrl+F`                        |
| Next / previous match                     | `F3` / `Shift+F3`                |
| Case-sensitive / whole-word on / off      | `Alt+C` / `Alt+W` (in the box)   |
| Escapes (`\n`, `\t`, `\xHH`) / regex      | `Alt+E` / `Alt+X` (in the box)   |
| Pick a past search                        | `Up` / `Down`, then `Ctrl+Enter` |
| Close the box, keep the search            | `Esc`, `Enter`                   |
| Replace                                   | `Ctrl+H`                         |
| Replace this one and go to the next       | `Enter` (in the dialog)          |
| Replace all                               | `Alt+A` (in the dialog)          |
| Only in the selection / everywhere        | `Alt+S` (in the dialog)          |

The search options are remembered between sessions.

## Completion and code

| What                                          | Key                     |
|-----------------------------------------------|-------------------------|
| Complete the word before the caret            | `Ctrl+Space`            |
| Next / previous candidate                     | `Down` / `Up`           |
| Mark / unmark this line                       | `Ctrl+F2`               |
| Next / previous marked line                   | `F2` / `Shift+F2`       |
| Compare with the last git commit (in cpx)     | `F5`                    |

Completion offers the words of the open file plus the word lists in
`~/.config/edx/words/`. Add your own there as `<name>.txt`, one word per
line.

**C and C++ only** (needs clangd):

| What                                                | Key                |
|-----------------------------------------------------|--------------------|
| Go to where the name is defined (opens a new edx)   | `F4`               |
| The signature of the call around the caret          | `Ctrl+Enter`       |
| What fits here — members after `.` / `->`, etc.     | `Ctrl+Shift+Enter` |
| Check the file and mark its errors                  | `Ctrl+Shift+F4`    |

Errors are also marked by themselves, a second after you stop typing.

clangd needs a `compile_commands.json` to know how your project is built.
Name it on the command line with `-c PATH`, or once for all files with
`doc.compile_commands` in the config. To let edx search for it upwards from
the file instead, set `doc.hybrid_find_compile_commands_bool` to `1`.

---

# Settings

Config file: `~/.config/edx/config.json`.
It starts as `{}` and edx never writes it again. Next to it:

- `config.example.json` — every setting with its shipped value, rewritten
  on each start, so it is never out of date. Copy the lines you want.
- `words/` — the completion word lists.

If edx cannot use your `config.json` (broken JSON, a bad value, an unknown
key), it starts on the shipped defaults and shows what was wrong in a box
over the first screen. Press `Enter` to close it.

Keys starting with `//` are ignored, so you can leave notes in the file:

```json
{ "// why": "I like tabs", "tab_use_spaces_bool": 0 }
```

Some settings worth knowing:

| Setting                          | Default          | What it does                                            |
|----------------------------------|------------------|---------------------------------------------------------|
| `tab_width`                      | `4`              | used when the file's own indent does not tell           |
| `tab_use_spaces_bool`            | `1`              | `Tab` inserts spaces; `0` = a tab character             |
| `auto_indent_bool`               | `1`              | a new line keeps the indent of the one above            |
| `wrap_bool`                      | `0`              | wrap long lines                                         |
| `mouse_bool`                     | `1`              | mouse support; `0` gives selection back to the terminal |
| `scroll_speed`                   | `3`              | lines per wheel notch                                   |
| `highlight_bool`                 | `1`              | syntax highlighting                                     |
| `highlight_word_at_cursor_bool`  | `1`              | light up the other matches of the word at the caret     |
| `confirm_quit_bool`              | `1`              | ask before quitting with unsaved changes                |
| `collapse_quits_bool`            | `1`              | `Esc` twice quits; `0` = `Esc` never quits              |
| `cursor_style`                   | `blinking_block` | also `steady_block`, and others in the example file     |
| `cursor_color`                   | `#ffff00`        | caret color                                             |
| `big_clock_bool`                 | `1`              | the big clock                                           |
| `big_clock_format`               | `%H:%M:%S`       | its format                                              |

Wrap, the big clock, the search options and the recent files are saved to
`state.json` when you change them, and win over the config file next time.

# Command line

```sh
edx FILE[:LINE] ...     # edit files, one tab each
edx --viewer FILE       # read-only
edx --search STR FILE   # start on the first match of STR
edx -c PATH FILE        # the compile_commands.json for C/C++ features
edx --config PATH       # use this config file
edx --no-config         # shipped defaults only
edx --defaults x        # the x or wt defaults, for this run
edx --no-mouse          # leave the mouse to the terminal
edx --keys              # report every binding
edx --cheatsheet        # the F1 sheet as plain text
edx --keyscan           # see what your terminal sends
edx --version           # the commit this build came from
```

---

- Opening this README was your last hurdle. See you next time in edx.
