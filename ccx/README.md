# ccx

A two-panel file manager (mc/Total Commander style) pinned above a **real
shell console**. The panels sit on top, your shell fills the rest of the
screen. You never leave the shell to browse, and you never leave the panels
to type a command.

The console is your own shell, not a copy of one. `cd`, `export`, aliases,
`.bash_history` and Up-recall all work, because your shell is what runs the
command.

## Install and run

```sh
python3 install.py     # installs uv, writes ccx's shell block
```

It prints one line to add at the **end** of your `~/.bashrc`:

```sh
. "$HOME/.local/share/dev-wxl.sh"
```

Open a new shell, then type `ccx`. It has to be a shell function, because
only a function can change the directory of the shell you are typing in —
that is what makes cd-on-exit work.

Nothing here writes `~/.bashrc` for you. Adding that line is your step.


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

# Features and their default keys

Press **F1** (also Ctrl+` or Shift+F1) at any time for the same list inside
ccx — it shows *your* keys, not these, if you rebound anything.
`./ccx.py --cheatsheet` prints it as text.

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
| Leave the results                     | `Backspace`   |

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

## Selection and clipboard

| What                                       | Key                                         |
|--------------------------------------------|---------------------------------------------|
| Select in the console, by character / word | `Shift+Left/Right`, `Ctrl+Shift+Left/Right` |
| Select across output and scrollback        | `Shift+Up` / `Shift+Down`                   |
| To line start / end                        | `Shift+Home` / `Shift+End`                  |
| Select the whole command line              | `Ctrl+A`                                    |
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

Config file: `~/.config/ccx/config.json` (on Windows, `%APPDATA%\ccx\`).
It starts as `{}` and ccx never writes it again. Next to it:

- `config.example.json` — every setting with its shipped value, rewritten
  on each start, so it is never out of date. Copy the lines you want.
- `def-win-cfg-01.json`, `def-win-cfg-02.json` — two complete alternative
  key layouts that avoid keys Windows Terminal answers itself. Copy one
  over `config.json`, or try it for one run with `--config <path>`.
- `themes/<name>.json` — your own color themes.

A `config.json` ccx cannot read stops it with an error, rather than
silently starting on defaults.

Keys starting with `//` are ignored, so you can leave notes in the file:

```json
{ "// why": "small screen", "layout": { "panel_height_percent": 18 } }
```

Some settings worth knowing:

| Setting                       | Default      | What it does                                                                      |
|-------------------------------|--------------|-----------------------------------------------------------------------------------|
| `show_hidden`                 | `true`       | show dotfiles                                                                     |
| `theme`                       | `dark`       | `dark`, `light`, or a file in `themes/`                                           |
| `splash`                      | `true`       | the startup animation                                                             |
| `sort_order`                  | `ext`        | `name`, `ext`, `size`, `mtime`                                                    |
| `panel_typing`                | `console`    | plain typing in a panel goes to the shell; `jump` makes it jump to a name instead |
| `layout.chrome`               | `minimal`    | `full` draws a full box around each panel                                         |
| `layout.panel_height_percent` | `25`         | how much of the screen the panels take                                            |
| `console_dim_amount`          | `0.4`        | how far the console fades while a panel has focus; `0.0` turns it off             |
| `console_scroll_lines`        | `1`          | lines per `PgUp` press                                                            |
| `console_follow_focus`        | `true`       | the shell follows the focused panel                                               |
| `swap_escape`                 | `ctrl+o`     | key that pulls ccx back over a running command                                    |
| `clock_time_format`           | `HH:MM:SS`   | left panel's clock; empty turns it off                                            |
| `clock_date_format`           | `YYYY-MM-DD` | right panel's clock                                                               |
| `panel_tools`                 | see above    | what F2/F3/F4/Ctrl+F run                                                          |

Panel heights, sort order and a few other choices you change at runtime are
saved to `state.json` the moment you change them, and win over the config
file next time.

# Command line

```
./ccx.py                       # normal start
./ccx.py --cwd DIR             # start both panels here
./ccx.py --theme light
./ccx.py --config PATH         # use this config file
./ccx.py --no-config           # shipped defaults only
./ccx.py --no-splash
./ccx.py --keys                # report every binding
./ccx.py --cheatsheet          # the F1 sheet as plain text
./ccx.py --keyscan             # see what your terminal sends
./ccx.py --version             # the commit this build came from
```


