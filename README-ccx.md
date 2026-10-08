# Welcome to WXL: Windows Experience on Linux.

> **Preview build — please do not share.**
> This is an early release for people I gave it to personally.
> Please do not pass it on, upload it, or post it anywhere yet.
> A public release will come later. The legal terms are in `LICENSE.txt`.

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

- easy QUIT: ctrl+q or ctrl+d, or click the red X in the top-right corner
- the quick menu: F2, or click the ≡ in the top-left corner
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

The full list is in [feature-list.md](feature-list.md).


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

# Sets of defaults: `wt`, `x`, `terminator`, `kitty`

ccx ships four sets of defaults:

- `wt` — keys that work in a stock Windows Terminal. Windows Terminal
  keeps some keys for itself, and those never reach ccx. This is the
  default.
- `x` — the author's own set, made for a Linux terminal.
- `terminator` and `kitty` — the `x` set, moved off the keys those two
  terminals keep for themselves.

Pick one with the environment variable `WXL_DEFAULTS`. It works for every
WXL app at once (ccx, edx, cpx, searchx, trx, hex):

```sh
export WXL_DEFAULTS=x      # Linux: put it in ~/.bashrc
setx WXL_DEFAULTS x        # Windows: new windows get it
```

- ccx also lets you pick a set in the F2 menu (`Keys for a terminal...`).
  The pick is saved in `~/.config/wxl/state.yml` and holds for every
  WXL app. On the first run the set for the terminal it detects
  (Windows Terminal, Terminator or kitty) is saved.
- Order: `--defaults <set>` for one run, then `WXL_DEFAULTS`, then the saved
  set, then the detected terminal, then `wt`.
- When the terminal is unknown, or the set in use is not the one for the
  terminal detected, ccx says so in a box at start. `C` in that box
  opens the list of sets; `D` turns the box off for good, in every WXL
  app.
- `--no-config` ignores `WXL_DEFAULTS` and uses `wt`, unless you also give
  `--defaults`.
- Your `config.yml` applies on top of either set.
- The F1 sheet, `--help` and `--keys` show which set is active, and why.

The key tables below show the `x` keys. In `wt` these are different:

| What | `x` | `wt` |
|---|---|---|
| Parent directory / follow, from panel or console | `Alt+Shift+Left` / `Alt+Shift+Right` | `Ctrl+Alt+Shift+Left` / `Ctrl+Alt+Shift+Right` |
| Focus the console / back to the panels | `Alt+Shift+Down` / `Alt+Shift+Up` | `Ctrl+Alt+Shift+Down` / `Ctrl+Alt+Shift+Up` |
| Recall slot 1..4 | `F9` .. `F12` | `Alt+F9` .. `Alt+F12` |
| Parent directory / follow, in the panel (Total Commander) | — | also `Ctrl+PgUp` / `Ctrl+PgDn` |
| Show the cursor's directory on the other side (Total Commander) | `Alt+F1` / `Alt+F2` | also `Ctrl+Left` / `Ctrl+Right` |
| Cycle the sort order (Total Commander) | `Ctrl+Alt+S` | also `Ctrl+F3`, `Ctrl+F4` |
| Insert the full path, in the panel (Total Commander) | `Ctrl+Alt+P` | also `Ctrl+P` |
| Not bound in `wt` (Windows Terminal takes them) | `Alt+Shift+arrows`, `Ctrl+Shift+Home/End`, `Ctrl+Insert`, `Shift+Insert`, `Ctrl+Shift+8` | — |

In `terminator` and `kitty` these differ from `x`:

| What | `x` | `terminator` | `kitty` |
|---|---|---|---|
| Help | `F1` | `Shift+F1` | `F1` |
| Recall slot 1..4 | `F9` .. `F12` | `Alt+F9` .. `Alt+F12` | same as `x` |
| Scroll the console a page | `Ctrl+PgUp` / `Ctrl+PgDn` | `Ctrl+Alt+PgUp` / `Ctrl+Alt+PgDn` | same as `x` |
| Panels off / on | `Ctrl+Backspace` | also `Ctrl+Alt+O` | same as `x` |
| Go up, from the console | also `Shift+Backspace` | `Alt+Backspace` only (Shift+Backspace arrives as Backspace) | same as `x` |
| Show hidden files | `Ctrl+Alt+H` | `Ctrl+F6` | same as `x` |
| Redo on the command line | `Ctrl+Shift+Z` | `Ctrl+Y` | `Ctrl+Y` |
| Select a word (prompt, console selection) | `Ctrl+Shift+Left/Right` | `Ctrl+Alt+Shift+Left/Right` | `Ctrl+Alt+Shift+Left/Right` |
| Insert file name / full path | also `Ctrl+Enter` / `Ctrl+Shift+Enter` | `Ctrl+Alt+F` / `Ctrl+Alt+P` only | full path: `Ctrl+Alt+P` only |
| Not bound | — | `Shift+Insert` | `Shift+Insert`, `Ctrl+Shift+Home/End`, `Ctrl+Shift+8` |

Terminator sends keys the old way, without modifier details. So a few
keys cannot reach ccx there at all: Enter with a modifier (enter or run,
count all directory sizes, locate in the other panel). Use Enter or
Right instead.

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
| Focus the left / right panel                        | `Alt+1` / `Alt+2`                                |
| Focus the console                                   | `Alt+3`, `Esc`, `Alt+Shift+Down`                 |
| Back to the panels                                  | `Esc`, `Alt+Shift+Up`                            |
| Swap to the other panel                             | `Tab`; `Shift+Tab` or ``Alt+Shift+` `` from anywhere |
| Show this panel's directory in the left / right one | `Alt+F1` / `Alt+F2`                              |
| Panels off — console takes the whole screen         | `Ctrl+Backspace`                                 |
| Panels one row taller / shorter                     | `Alt+PgDn` / `Alt+PgUp`                          |
| Resize by mouse                                     | drag the panels' bottom rule                     |
| Quit (and `cd` the shell to the panel's directory)  | `Ctrl+Q`, `Ctrl+D`, click the red `X` top right  |

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
| Move the cursor                                     | `Up` / `Down`; `Shift+Up` / `Shift+Down` from anywhere |
| Page / first / last                                 | `PgUp` / `PgDn` / `Home` / `End`            |
| Enter a directory or archive                        | `Right`                                     |
| Go up one directory                                 | `Left`, `Backspace`, `Shift+Backspace`      |
| Parent / enter, from the panel or the console       | `Alt+Shift+Left` / `Alt+Shift+Right`        |
| Enter a folder or run a file, from panel or console | `Shift+Enter`                               |
| Go up, from the console                             | `Shift+Backspace`; `Alt+Backspace` at an empty prompt |
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
| Invert the mark under the pointer            | right-click       |
| Give every row crossed the same mark         | right-drag        |
| Invert all marks                             | `*`               |
| Mark / unmark every file with this extension | `+` / `-`         |
| Count the size of every directory shown      | `Ctrl+Alt+Enter`, `Ctrl+Alt+Shift+Enter` |

## File operations

| What                                       | Key         |
|--------------------------------------------|-------------|
| Copy marked entries to the other panel     | `F5`        |
| Same, with the mouse                       | drag onto the other panel |
| Copy, following symlinks to the real file  | `Ctrl+F5`   |
| Copy this one file beside itself, new name | `Shift+F5`  |
| Move / rename to the other panel           | `F6`        |
| Rename this one entry in place             | `Shift+F6`  |
| Delete marked entries                      | `F8`, `Del`; `Shift+Del` from the console |
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

Every prompt can be answered with the mouse: the `F5`–`F8` prompts have
OK and Cancel buttons, and each answer of a question is clickable.
Dropping files on a directory row of the other panel copies into that
directory; dropping anywhere else on that panel copies into the panel's
own directory.

## Panel tools

These launch other programs. The commands are in the config, so you can
point them at your own tools.

| What                        | Key        | Runs by default |
|-----------------------------|------------|-----------------|
| View the file               | `F3`       | `edx --viewer`  |
| Edit the file               | `F4`       | `edx`           |
| Search below this directory | `Ctrl+F` (panel) | `searchx` |
| Compare two files           | `Shift+F2` | `cpx`           |

`Shift+F2` picks the pair itself: the two marked files, or the entry under the
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
| Undo / redo on the command line             | `Ctrl+Z` / `Ctrl+Shift+Z`        |
| Give the screen back to the command         | `Ctrl+Backspace`                 |
| Type into the shell while a panel has focus | any printable key                |
| Scroll back one line                        | `PgUp` / `PgDn`                  |
| Scroll back half a pane                     | `Ctrl+PgUp` / `Ctrl+PgDn`        |
| Scroll back three lines                     | mouse wheel                      |
| Find text in the console                    | `Ctrl+F`                         |
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
line (a second `Enter` runs it), `Del` deletes it from the history, `Esc`
closes the list. The list is ccx's own
history file, `~/.local/share/ccx/ccx-history.txt`, shared by every ccx you
run: a command run in one terminal is in the next `Up` list of all the
others. The first run fills it from `~/.bash_history`; a command that starts
with a space is not kept. Set `console_history_ccx_bool` to `0` to list the
shell's own history instead. Without ccx's bash integration (another shell,
no prompt marks) `Up` is the shell's own Up.

The list also opens by itself when you start typing on an empty command
line. Then `Enter` runs what you typed, as usual; it takes an entry from the
list only after you have moved the selection with `Up`/`Down`.

`Ctrl+Space` in the list puts a wildcard on the line, shown as a purple `*`.
It stands for any text: `e*ho` finds `echo`. A line with a wildcard is a
search, so `Enter` does not run it — pick an entry, or delete the `*`.
Copying it gives a plain `*`.

A `*` you type yourself is a wildcard for the search too, and is shown
purple as well. It still runs as a normal `*` (`ls *.py` works). Type `\*`
to search for a real star.

`Tab` on a typed line completes the file name under the cursor — ccx does it,
bash never sees the key. The word is matched from its start, and a wildcard
stands for any text: with `report_q1_final`, `report_q2_final` and
`report_q3_draft` in the folder, `rep*fin` + `Tab` leaves only the two
`final` ones. One match replaces the word at once. Several open a second
list, on a blue plate, next to the word; typing narrows it, `Up`/`Down` walk
it, `Enter` or `Tab` puts the selected name in place of the word, `Esc`
closes it. `Ctrl+Space` types the wildcard here too. Only one of the two
lists is open at a time. On an empty line `Tab` still switches the panel.

On the first word of a command — or after `|`, `;`, `&&`, `sudo` — `Tab`
lists command names instead: aliases, functions, builtins, programs on
your `PATH`, and the files and folders here. Each kind has its own
colour: aliases orange, functions violet, builtins yellow, programs and
folders in the panel's own colours, files in the list's plain colour. Functions starting with `_` show only when
you type the `_`. This needs bash with ccx's shell integration;
elsewhere `Tab` lists file names.

`Ctrl+F` in the console opens a find box on its bottom row. Every match in
the console and its scrollback lights up; case does not matter. Each key you
type flashes the matches yellow, then they fade to blue. The current match
is orange, and the box shows which one it is (`2/11`, counted from the
newest). `Enter` or `F3` go to the next older match, `Shift+Enter` or
`Shift+F3` to the next newer one; the console scrolls to it. `Esc` closes
the box. In a panel, `Ctrl+F` is still the `searchx` tool.

Past find texts are kept, as in edx. A list above the box shows the ones
that contain what you typed, newest at the bottom. `Up`/`Down` walk it,
`Ctrl+Enter` puts the selected text in the box, and so does `Enter` after
you walked the list; `Del` then deletes it from the history. The next
`Ctrl+F` starts with the last text, selected.

## Selection and clipboard

| What                                       | Key                                         |
|--------------------------------------------|---------------------------------------------|
| Select in the console, by character / word | `Shift+Left/Right`, `Ctrl+Shift+Left/Right` |
| Select across output and scrollback        | drag with the mouse                         |
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
| Quick menu                                 | `F2`                                        |

A selection lights up its other occurrences in the console. Green is the
same case, olive another case; the brighter plate is a whole word, the
darker one part of a longer word. The colours are `selmatch*_bg` in
`colors`.

The quick menu copies the marked entries (or the one under the cursor) as
text, in the panel's order: names, full paths, names with details, or full
paths with details. Details are size, date, permissions and owner:group, in aligned
columns; sizes are right-aligned with grouped digits, as in the panel.
Its sort-order item shows the order; picking it steps to the next one
and keeps the menu open. `Keys for a terminal...` lists the sets of keys
(`x`, `wt`, `terminator`, `kitty`), marks the one saved and the one in
use, and switches to the one you pick at once. Pick an item with its number, or with the arrows
and `Enter`. `quick_menu.items` in the config lists what the menu shows.

`User commands...` lists your own commands from `user_menu.items` in the
config. ccx ships none. Each one runs on the marked entries, or on the
entry under the cursor; `{paths}` in the command becomes all of them,
each quoted. `{other_paths}` is the same from the other panel. The marks
stay.

`user_args` lists values to ask for before the run, one box each, in
order. The command reads them as `{user_arg1}`, `{user_arg2}`, …, each
quoted as one word. An entry is a label, or `{ label: …, default: … }`
to prefill its box. Esc or an empty box cancels the run.

```yaml
user_menu: {
    items: [
        { label: Join text files, user_args: [Output file],
          command: "cat {paths} > {user_arg1}", },
        { label: Join MP3 files,
          user_args: [{ label: Output file, default: joined.mp3 }],
          command: "mp3join {user_arg1} {paths}", },
    ],
},
```

`launch` is `console` (default: typed into the shell, the output stays in
the console) or `fullscreen`. Not on a remote panel or in an archive.
`{other_paths}` and `user_args` work in `panel_tools` commands too.

---

# Settings

Config file: `~/.config/ccx/config.yml`.
It starts as `{}` and ccx never writes it again. Next to it:

- `win-term-config.yml`, `x-config.yml`, `terminator-config.yml` and
  `kitty-config.yml` — every setting with its shipped value, one file
  per set of defaults. Rewritten on each start, so they are never out of
  date. Copy the lines you want from the file for your terminal.
- `themes/<name>.yml` — your own color themes.

Settings for every WXL app at once go in `~/.config/wxl/config.yml`.
It sits under each app's own `config.yml`: a key there applies to every
WXL app, and an app's own file still wins for that app. Beside it,
`example-config.yml` lists the settings all the apps share, with a
comment on each key: the typing flash (`type_flash`) and the key demo
(`demo_keys`). It is rewritten on every start and never read, so copy
the lines you want into `wxl/config.yml`:

```yaml
{
    # a slower, orange typing flash, in every app
    type_flash: { color: "#ffaf00", fade_seconds: 2.0, },
}
```

If ccx cannot use your `config.yml` (broken YAML, a bad value, an unknown
key), it starts on the shipped defaults and shows what was wrong in a box
over the first screen. Press `Enter` to close it.

The file is YAML. `#` starts a comment, and most values need no quotes:

```yaml
{
    # small screen
    layout: { panel_height_percent: 18, },
}
```

A value with `#`, `:`, `,` or brackets in it needs quotes (`"#202020"`).
An old `config.json` is converted to `config.yml` on start, and ccx
asks: keep the `.json` file, delete it, or Esc to ask again next start.

Some settings worth knowing:

| Setting                             | Default      | What it does                                                                  |
|-------------------------------------|--------------|-------------------------------------------------------------------------------|
| `show_hidden_bool`                  | `1`          | show dotfiles                                                                 |
| `theme`                             | `dark`       | `dark`, `light`, or a file in `themes/`                                       |
| `splash_bool`                       | `1`          | the startup animation                                                         |
| `left_start_cwd`, `right_start_cwd` | `auto`       | where each panel opens, see below                                             |
| `sort_order`                        | `name`       | `name`, `ext`, `size`, `mtime`                                                |
| `panel_typing`                      | `console`    | plain typing in a panel goes to the shell; `jump` makes it jump to a name     |
| `layout.chrome`                     | `minimal`    | `full` draws a full box around each panel                                     |
| `layout.panel_height_percent`       | `25`         | how much of the screen the panels take                                        |
| `console_dim_amount`                | `0.4`        | how far the console fades while a panel has focus; `0.0` = off                |
| `console_scroll_lines`              | `1`          | lines per `PgUp` press                                                        |
| `console_history_rows`              | `12`         | most entries the `Up` history list shows at once                              |
| `console_history_ccx_bool`          | `1`          | the `Up` list is ccx's own history file, shared by every ccx; `0` = ask the shell |
| `console_history_max_entries`       | `10000`      | most commands ccx's history file keeps                                        |
| `console_history_full_bool`         | `1`          | with `console_history_ccx_bool` `0`: the list also holds the whole history file; `0` = the shell's list only |
| `console_history_auto_bool`         | `0`          | `1` = typing on an empty command line opens the `Up` list; `0` = only `Up` opens it |
| `console_complete_rows`             | `12`         | most names the `Tab` file-name list shows at once                             |
| `console_find_flash_hold_seconds`   | `0.08`       | how long `Ctrl+F`'s matches stay fully lit after each key                     |
| `console_find_flash_fade_seconds`   | `0.6`        | how long they then take to fade to the match colour                           |
| `console_find_history_size`         | `20`         | how many past find texts are kept                                             |
| `console_follow_focus_bool`         | `1`          | the shell follows the focused panel                                           |
| `swap_escape`                       | `ctrl+o`     | key that pulls ccx back over a running command                                |
| `clock_time_format`                 | `HH:MM:SS`   | left panel's clock; empty turns it off                                        |
| `clock_date_format`                 | `YYYY-MM-DD` | right panel's clock; empty turns it off                                       |
| `panel_tools`                       | see above    | what Shift+F2 / F3 / F4 / Ctrl+F run                                          |
| `user_menu`                         | empty        | your own commands under F2's `User commands...`                               |

`left_start_cwd` / `right_start_cwd`: `auto` opens the last session's
directory when the shell started ccx by itself, and the current directory
when you typed `ccx`. The other values are `cwd`, `home` and `last_state`.

Panel heights, sort order and a few other choices you change at runtime are
saved to `state.yml` the moment you change them, and win over the config
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
ccx --demo-keys         # show each key and mouse click, for recordings
ccx --keys              # report every binding
ccx --cheatsheet        # the F1 sheet as plain text
ccx --keyscan           # see what your terminal sends
ccx --version           # the commit this build came from
```

Stuck in Vim reading this? Don't panic: close the terminal, or restart the PC if you must.
See you next time in CCX/EDX.

