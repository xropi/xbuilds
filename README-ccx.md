# Welcome to WXL: Windows Experience on Linux.

WXL is here to rescue the poor souls forced to endure raw, unforgiving Linux.
No more typing paths. No more memorizing commands. No more suffering.
Just pure joy while you watch others wrestle with Bash.


# ccx

An integrated suite of sophisticated TUI tools, powerful on their own and even
better together, that fix Linux's infamous weaknesses and usability issues.


A two-panel file manager (mc / Total Commander style) pinned above a **real
shell console**. The panels sit on top, and your shell fills the rest of the
screen. You never leave the shell to browse, and you never leave the panels
to type a command: one screen holds the whole workflow.

Features

- easy QUIT: ctrl+q or ctrl+d
- **F1**, or a click on *Help*, shows every key with context.
- No more typing paths or file names, and no guessing full paths.
- Full select / copy / paste on the command line, with the usual keys:
  `Shift+Left/Right`, `Ctrl+Shift+Left/Right`, `Ctrl+C/V/X`.
- Integrated file panel and permanent console for smooth and rich console experience.
- Stop guessing full paths; just pick what you need from the top panel.
- Tab completion, taken to the next level. Type '*' wildcards anywhere
	in a name and choose from a list of matching files that narrows as you type.
- Familiar editing on the command line. Select with Shift+Left/Right and Ctrl+Shift+Left/Right,
	then cut, copy and paste with Ctrl+X, Ctrl+C and Ctrl+V.
- Command history list. Narrow it down instantly with wildcards.
- Panel and shell stay in sync. Navigating a panel moves the shell with it,
	even while you're composing a command, and vice versa: when a command
	changes the directory, the active panel follows.
- Fully configurable key bindings. Any Ctrl, Shift and Alt combination is supported.
- 24-bit color
- colored animations and effects.


The console is your own shell, not a copy of one. `cd`, `export`, aliases,
`.bash_history` and Up-recall all work, because your shell is what runs the
command.

This README is for the **binary release**: one Linux program, no Python
needed. To run ccx from its Python source instead, see `README-py.md`.

## Install

You need two files from the release folder:

- `ccx.tar.gz` — the program and its installer
- `extract.sh` — unpacks the tarball and runs the installer

Put both in one directory on the target machine, then run:

```sh
sh extract.sh
```

It works on any Linux with glibc 2.28 or newer (any distro from 2018 on).
Use `sh extract.sh`, not `./extract.sh`: the file may have lost its exec bit
on the way over, and `sh` does not need it.

What it installs:

- the `ccx` binary into `~/.local/bin`
- the `ccx` shell function and its files into `~/.local/share/ccx/`
- ccx's block in `~/.local/share/dev-wxl.sh`

At the end it prints one line. Add it at the **end** of your `~/.bashrc`:

```sh
. "$HOME/.local/share/dev-wxl.sh"
```

Open a new shell, then type `ccx`. It has to be a shell function, because
only a function can change the directory of the shell you are typing in.
That is what lets ccx leave you in the panel's directory when you quit.

Nothing writes `~/.bashrc` for you. Adding that line is your step.

Installer options (pass them to `extract.sh`):

| Option           | What it does                                               |
|------------------|------------------------------------------------------------|
| `--prefix DIR`   | put the binary in `DIR` instead of `~/.local/bin`          |
| `--system`       | install for every user (needs `sudo`), see below           |
| `--no-install`   | only unpack, do not install                                |

**For every user:** `sudo sh extract.sh --system`. The binary goes to
`/usr/local/bin`, the shared files to `/usr/local/share/wxl/`, and one block
goes into `/etc/bash.bashrc`, so no user has to edit anything. A user's own
install still wins over the system one.

**Start ccx in every new shell** (optional): uncomment the last line of
`~/.local/share/dev-wxl.sh`. It must stay last, because ccx hosts a shell,
and nothing below that line runs until ccx exits.

**Uninstall:**

```sh
sh ~/.local/share/wxl/uninstall.sh ccx
sudo sh /usr/local/share/wxl/uninstall.sh ccx     # a --system install
```

It removes only the files the installer wrote, and only if nobody changed
them since.

## The screen

```
┌ left panel ────── 10:42:07 ┬ right panel ─── 2026-08-31 ┐
│ files                      │ files                      │
├────────────────────────────┴────────────────────────────┤
  your shell, full width, dimmed while a panel has focus
  $ _
```

The clock lives in the two panels' top-right corners: time on the left
panel, date on the right.

---

# Two sets of defaults: `wt` and `x`

ccx ships two sets of defaults:

- `wt` — keys that work in a stock Windows Terminal. Windows Terminal
  keeps some keys for itself, and those never reach ccx. This is the
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
| Focus the left / right panel | `Ctrl+Left` / `Ctrl+Right` | `Ctrl+Alt+Left` / `Ctrl+Alt+Right` |
| Focus the console / the panels | `Ctrl+Down` / `Ctrl+Up` | `Ctrl+Alt+Down` / `Ctrl+Alt+Up` |
| Parent directory / follow, from the console | `Ctrl+Left` / `Ctrl+Right` | `Ctrl+Alt+Left` / `Ctrl+Alt+Right` |
| Move the panel's cursor from the console | `Alt+Shift+Up` / `Alt+Shift+Down` | `Ctrl+Alt+PgUp` / `Ctrl+Alt+PgDn` |
| Recall slot 1..4 | `F9` .. `F12` | `Alt+F9` .. `Alt+F12` |
| Count the size of every directory shown | `Alt+Shift+Enter` | also `Ctrl+Alt+Enter` |
| Not bound in `wt` (Windows Terminal takes them) | `Alt+Shift+arrows` in a panel, `Ctrl+Shift+Home/End`, `Ctrl+Insert`, `Shift+Insert`, `Ctrl+Shift+8` | — |

`Alt+Shift` and `Ctrl+Shift` also switch the keyboard layout in Windows
when more than one input language is installed. To stop that: Settings →
Time & language → Typing → Advanced keyboard settings → Input language
hot keys → Not Assigned.

---

# Features and their default keys

Press **F1** at any time for the same list inside ccx. It shows *your*
keys, not these, if you rebound anything. `ccx --cheatsheet` prints it as
text.

## Focus and panels

| What                                                | Key                                              |
|-----------------------------------------------------|--------------------------------------------------|
| Focus the left / right panel                        | `Alt+1` / `Alt+2`, or `Ctrl+Left` / `Ctrl+Right` |
| Focus the console                                   | `Alt+3`, `Esc`, `Ctrl+Down`                      |
| Back to the panels                                  | `Esc`, `Ctrl+Up`                                 |
| Swap to the other panel                             | `Tab`                                            |
| Show this panel's directory in the left / right one | `Alt+F1` / `Alt+F2`                              |
| Panels off — console takes the whole screen         | `Ctrl+Backspace`                                 |
| Panels one row taller / shorter                     | `Alt+PgDn` / `Alt+PgUp`                          |
| Resize by mouse                                     | drag the panels' bottom rule                     |
| Quit (and `cd` the shell to the panel's directory)  | `Ctrl+Q`, `Ctrl+D`                               |

When you switch panels, the shell follows that panel's directory. So the
next command you type runs where you are looking. It does not follow while
you have a half-typed command line — a glance at the other panel should not
disturb your typing.

**Layout slots.** Save both panels' directories and cursors, then recall
them — even in a ccx running in another terminal pane.

| What              | Key                     |
|-------------------|-------------------------|
| Save to slot 1..4 | `Ctrl+F9` .. `Ctrl+F12` |
| Recall slot 1..4  | `F9` .. `F12`           |

## Moving around

| What                                                | Key                                         |
|-----------------------------------------------------|---------------------------------------------|
| Move the cursor                                     | `Up` / `Down`                               |
| Page / first / last                                 | `PgUp` / `PgDn` / `Home` / `End`            |
| Enter a directory or archive                        | `Right`                                     |
| Go up one directory                                 | `Left`, `Backspace`                         |
| Same two moves, from the console at an empty prompt | `Ctrl+Left` / `Ctrl+Right`, `Alt+Backspace` |
| Open: run an executable, else view it               | `Enter`                                     |
| Jump to a name by typing                            | `Alt+<letter>`, then plain letters          |
| Reload both panels                                  | `Ctrl+R`                                    |
| Show / hide dotfiles                                | `Ctrl+Alt+H`                                |
| Cycle sort (name / ext / size / date)               | `Ctrl+Alt+S`                                |
| Cycle the free-space unit, both panels              | `Ctrl+Alt+U`                                |
| Sizes as exact bytes / as K, M, G                   | `Ctrl+B`                                    |

**Jumping to a name needs Alt.** A plain letter in a panel goes to the
shell instead: focus moves to the console and the letter starts a command
line there.

`Alt+<letter>` starts the jump. After that the jump is running, so plain
letters keep extending it — you only need Alt for the first one. Backspace
edits the pattern. A letter that matches nothing is still added, and the
cursor stays where it last matched, so you can backspace out of a typo
without starting over. `Esc`, or any panel key that does something else,
ends the jump.

## Marking files

| What                                         | Key               |
|----------------------------------------------|-------------------|
| Mark / unmark and step down                  | `Space`, `Ins`    |
| Invert all marks                             | `*`               |
| Mark / unmark every file with this extension | `+` / `-`         |
| Count the size of every directory shown      | `Alt+Shift+Enter` |

## File operations

| What                                       | Key         |
|--------------------------------------------|-------------|
| Copy marked entries to the other panel     | `F5`        |
| Copy, following symlinks to the real file  | `Ctrl+F5`   |
| Copy this one file beside itself, new name | `Shift+F5`  |
| Move / rename to the other panel           | `F6`        |
| Rename this one entry in place             | `Shift+F6`  |
| Delete marked entries                      | `F8`, `Del` |
| New directory                              | `F7`        |
| New file, opened in the editor             | `Shift+F4`  |
| Pack marked entries into an archive        | `Alt+F5`    |
| Stop the running operation                 | `Esc`       |

A long operation opens a progress box: a bar for the current file, a bar
for the whole job, and a speed graph. It appears only after 0.2 s, so a
fast rename never flashes a dialog at you. `Esc` cancels; what was already
copied stays, and the rest stays marked so you can retry.

When a file already exists at the destination, ccx asks — per file, never
once for a whole tree. Press the letter in brackets; a capital letter means
"all of them". `Enter` takes the default answer.

## Panel tools

These launch other programs. The commands are in the config, so you can
point them at your own tools.

| What                        | Key      | Runs by default |
|-----------------------------|----------|-----------------|
| View the file               | `F3`     | `edx --viewer`  |
| Edit the file               | `F4`     | `edx`           |
| Search below this directory | `Ctrl+F` | `searchx`       |
| Compare two files           | `F2`     | `cpx`           |

`F2` picks the pair itself: the two marked files, or the entry under the
cursor against the other panel's file with the same name.

A search fills the panel with its hits ("panelized"). Then:

| What                                  | Key           |
|---------------------------------------|---------------|
| Go to the hit's real directory        | `Enter`       |
| Send the other panel there and follow | `Shift+Enter` |
| Leave the results                     | `Left`        |

## Remote panels and archives

| What                                    | Key                           |
|-----------------------------------------|-------------------------------|
| Connect the left / right panel over ssh | `Ctrl+F1` / `Ctrl+F2`         |
| Disconnect it                           | `Ctrl+Alt+F1` / `Ctrl+Alt+F2` |
| Enter an archive like a directory       | `Right`, `Enter`              |
| Leave it                                | `Left`, `Backspace`           |

The host list comes from `~/.ssh/config` — names only, so ssh still handles
users, ports, keys and jump hosts. ccx keeps no host list of its own.

**The console always stays local.** It never `cd`s to a remote path and
never runs a command on the far side. That is on purpose, not a gap. If you
want a remote shell, type `ssh host` in the console.

An archive is browsed as if it were a directory, so **extracting is just
`F5` out of it** — with the same questions and the same progress box. There
is no separate extract command.

## The console

| What                                        | Key                              |
|---------------------------------------------|----------------------------------|
| Run the typed line, full-screen             | `Enter`                          |
| Pull ccx back over a running command        | `Ctrl+O`                         |
| Show the shell's history as a list          | `Up`                             |
| Give the screen back to the command         | `Ctrl+Backspace`                 |
| Type into the shell while a panel has focus | any printable key                |
| Scroll back one line                        | `PgUp` / `PgDn`                  |
| Scroll back half a pane                     | `Ctrl+PgUp` / `Ctrl+PgDn`        |
| Scroll back three lines                     | mouse wheel                      |
| Insert the entry's name                     | `Ctrl+Alt+F`, `Ctrl+Enter`       |
| Insert its full path                        | `Ctrl+Alt+P`, `Ctrl+Shift+Enter` |
| Insert the panel's directory                | `Ctrl+Alt+D`                     |

`Enter` hands the whole terminal to the shell for as long as the command
runs, then takes it back. The command's output lands in normal scrollback,
so `Up` recalls the command afterwards like any other.

`Up` at the prompt shows the shell's history as a list above the command
line, newest at the bottom. Only entries that contain what you have typed are
shown, and typing narrows the list further. `Up`/`Down` walk it,
`PgUp`/`PgDn` move a page, `Enter` puts the selected entry on the command
line (a second `Enter` runs it), `Esc` closes it. It is the shell's own
history, so this session's commands are in it. Without ccx's bash
integration (another shell, no prompt marks) `Up` is the shell's own Up.

The list also opens by itself when you start typing on an empty command
line. Then `Enter` runs what you typed, as usual; it takes an entry from the
list only after you have moved the selection with `Up`/`Down`.

`Ctrl+Space` in the list puts a wildcard on the line, shown as a purple `*`.
It stands for any text: `e*ho` finds `echo`. A line with a wildcard is a
search, so `Enter` does not run it — pick an entry, or delete the `*`.
Copying it gives a plain `*`.

`Tab` on a typed line completes the file name under the cursor — ccx does it,
bash never sees the key. The word is matched from its start, and a wildcard
stands for any text: with `report_q1_final`, `report_q2_final` and
`report_q3_draft` in the folder, `rep*fin` + `Tab` leaves only the two
`final` ones. One match replaces the word at once. Several open a second
list, on a blue plate, next to the word; typing narrows it, `Up`/`Down` walk
it, `Enter` or `Tab` puts the selected name in place of the word, `Esc`
closes it. `Ctrl+Space` types the wildcard here too. Only one of the two
lists is open at a time. On an empty line `Tab` still switches the panel.

## Selection and clipboard

| What                                       | Key                                         |
|--------------------------------------------|---------------------------------------------|
| Select in the console, by character / word | `Shift+Left/Right`, `Ctrl+Shift+Left/Right` |
| Select across output and scrollback        | `Shift+Up` / `Shift+Down`                   |
| To line start / end                        | `Shift+Home` / `Shift+End`                  |
| Select the command line; again: everything | `Ctrl+A`, then `Ctrl+A` again               |
| Copy                                       | `Ctrl+C`, `Ctrl+Ins`                        |
| Cut                                        | `Ctrl+X`, `Shift+Del`                       |
| Paste                                      | `Ctrl+V`, `Shift+Ins`                       |
| Drop the selection                         | `Esc`                                       |
| Select with the mouse                      | drag                                        |
| Right-click                                | copy with a selection, paste without one    |
| Copy marked paths / names from a panel     | `Ctrl+C` / `Ctrl+Alt+C`                     |
| Cut them, so a paste moves                 | `Ctrl+X`                                    |
| Paste into this panel's directory          | `Ctrl+V`                                    |

---

# Settings

Config file: `~/.config/ccx/config.json`.
It starts as `{}` and ccx never writes it again. Next to it:

- `config.example.json` — every setting with its shipped value, rewritten
  on each start, so it is never out of date. Copy the lines you want.
- `themes/<name>.json` — your own color themes.

If ccx cannot use your `config.json` (broken JSON, a bad value, an unknown
key), it starts on the shipped defaults and shows what was wrong in a box
over the first screen. Press `Enter` to close it.

Keys starting with `//` are ignored, so you can leave notes in the file:

```json
{ "// why": "small screen", "layout": { "panel_height_percent": 18 } }
```

Some settings worth knowing:

| Setting                             | Default      | What it does                                                                  |
|-------------------------------------|--------------|-------------------------------------------------------------------------------|
| `show_hidden_bool`                  | `1`          | show dotfiles                                                                 |
| `theme`                             | `dark`       | `dark`, `light`, or a file in `themes/`                                       |
| `splash_bool`                       | `1`          | the startup animation                                                         |
| `left_start_cwd`, `right_start_cwd` | `auto`       | where each panel opens, see below                                             |
| `sort_order`                        | `ext`        | `name`, `ext`, `size`, `mtime`                                                |
| `panel_typing`                      | `console`    | plain typing in a panel goes to the shell; `jump` makes it jump to a name     |
| `layout.chrome`                     | `minimal`    | `full` draws a full box around each panel                                     |
| `layout.panel_height_percent`       | `25`         | how much of the screen the panels take                                        |
| `console_dim_amount`                | `0.4`        | how far the console fades while a panel has focus; `0.0` = off                |
| `console_scroll_lines`              | `1`          | lines per `PgUp` press                                                        |
| `console_history_rows`              | `12`         | most entries the `Up` history list shows at once                              |
| `console_history_full_bool`         | `1`          | the `Up` list also holds the whole history file; `0` = the shell's list only  |
| `console_history_auto_bool`         | `1`          | typing on an empty command line opens the `Up` list; `0` = only `Up` opens it |
| `console_complete_rows`             | `12`         | most names the `Tab` file-name list shows at once                             |
| `console_follow_focus_bool`         | `1`          | the shell follows the focused panel                                           |
| `swap_escape`                       | `ctrl+o`     | key that pulls ccx back over a running command                                |
| `clock_time_format`                 | `HH:MM:SS`   | left panel's clock; empty turns it off                                        |
| `clock_date_format`                 | `YYYY-MM-DD` | right panel's clock; empty turns it off                                       |
| `panel_tools`                       | see above    | what F2 / F3 / F4 / Ctrl+F run                                                |

`left_start_cwd` / `right_start_cwd`: `auto` opens the last session's
directory when the shell started ccx by itself, and the current directory
when you typed `ccx`. The other values are `cwd`, `home` and `last_state`.

Panel heights, sort order and a few other choices you change at runtime are
saved to `state.json` the moment you change them, and win over the config
file next time.

# Command line

```sh
ccx                     # normal start
ccx --cwd DIR           # start both panels here
ccx --theme light
ccx --config PATH       # use this config file
ccx --no-config         # shipped defaults only
ccx --defaults x        # the x or wt defaults, for this run
ccx --no-splash
ccx --keys              # report every binding
ccx --cheatsheet        # the F1 sheet as plain text
ccx --keyscan           # see what your terminal sends
ccx --version           # the commit this build came from
```

Stuck in Vim reading this? Don't panic: close the terminal, or restart the PC if you must.
See you next time in CCX/EDX.

