# ccx — feature list

Everything ccx can do today, one line per feature. Keys are not listed here:
press F1 in ccx, or see `README.md`.

## Screen and layout

- Two file panels on top, your real shell console below, full width.
- Resize the split between panels and console by key, or by dragging the
  panels' bottom rule.
- The panel height can be a share of the screen or a fixed row count.
- Turn the panels off, so the console takes the whole screen; turn them on again.
- A running command gets the whole screen; the panels come back when it ends.
- Function-key bar between panels and console: click a label to press that key.
- Right-click a function-key label: its Shift/Ctrl/Alt variants as a menu.
- Roast lines scroll through the function-key bar.
- Roast lines: pick their topics; each brakes at the centre, stays, and
  leaves in rainbow colors.
- Minimal frame (default) or full frame.
- Clock: time over the left panel, date over the right; formats are configurable.
- The clocks tick steadily, even when the system clock is adjusted a little.
- Big seven-segment clock in the console's top-right corner; toggle it by key.
- Status hints and the scrollback position in the console's top-right corner.
- Red X in the top-right corner quits.
- Panel borders show whether the panels or the console have focus.
- The cursor bar shows only in the active panel.
- The author's name and a DONATE button on the cheat sheet's bottom rule.
- Dark and light themes, plus your own theme files.
- File names colored by type: directories, executables, hidden files,
  extension groups.
- The console is dimmed while a panel has focus.
- Startup animation that dissolves into ccx's first frame; can be turned off
  or shortened.

## Effects

- Focus wave: a moving color wave on the borders, the command line and the big
  clock shows which pane has focus.
- The wave is fully configurable: shape, length, speed, colors, strength, in
  layers.
- A ring from the centre on every focus change; inward when the pane loses focus.
- A ring at every mouse click.
- Rings are configurable.
- `--demo-keys`: every key pressed, mouse click and wheel step flashes in
  the bottom-right corner in running colours, with a ring, then fades. For
  recordings; configurable.
- The cursor is painted by ccx, so its blink is steady while you type.

## Panel listing

- Sort by name, extension, size or date.
- Sorting by extension keeps directories in name order.
- Show or hide dotfiles.
- Sizes as exact bytes with grouped digits, or as K/M/G — one switch for
  both panels.
- Free and total drive space per panel, in a unit you cycle (B..P).
- Totals bar: count and size of marked and all entries.
- Totals bar groups have their own colors.
- Count the size of one directory, or of every directory shown.
- The cursor row changes only the background, so file colors stay readable.
- A panel reloads by itself when its directory changes on disk.
- Reload both panels by key.

## Panel navigation

- Cursor up/down, page up/down, first/last entry.
- Enter a directory or archive; go to the parent.
- Going to the parent puts the cursor on the folder you came from.
- Open: run an executable, otherwise view it.
- Enter a folder or run a file with one key, from the panel or the console.
- Type to jump to a name: Alt plus the first letter, then plain letters.
  A typo keeps the cursor on the last match; Backspace fixes it.
- A plain letter in a panel starts a command line in the console instead.
- Mouse: click to move the cursor, double-click to open, wheel to scroll.
- A click on a panel's empty area activates that panel.
- Show this panel's directory in the other panel (mirror); from an archive,
  the other panel opens the archive's folder.
- Layout slots: save both panels' directories and cursors to 4 slots;
  recall them, even in a ccx running in another terminal pane.
- The start directory is the last one used, or the shell's current one;
  configurable per panel.

## Panel navigation from the console

- Move the linked panel's cursor up/down while typing in the console.
- Go to the parent / enter the cursor folder from the console; focus stays
  in the console.
- Switch the linked panel from the console (Tab on an empty line, or a key
  that works on any line).
- Move focus between console and panels by key or by click.
- View, edit, search and compare work from the console too, on the linked
  panel's cursor entry.
- Insert the cursor entry's name, full path, or the panel's directory into
  the command line, from either region.

## Marking

- Mark / unmark and step down.
- Right-click inverts a row's mark; right-drag gives every row crossed the
  same mark.
- Invert all marks.
- Mark / unmark every file with the cursor entry's extension.
- A cancelled or failed operation leaves the unfinished entries marked, for
  a retry.

## File operations

- Copy, move, delete, new directory.
- The new-directory prompt starts with the cursor entry's name.
- Copy that follows symlinks to the real files; normal copy keeps links as links.
- Copy one entry beside itself under a new name.
- Rename one entry in place; case-only renames work.
- New file, opened in the editor at once.
- Copy by dragging files onto the other panel, or onto a directory row there.
- While dragging, a pulsing blob shows what is carried.
- Copy, cut and paste files between panels through the clipboard.
- Folders merge: only colliding files are asked about, one by one.
- Overwrite question: overwrite / overwrite all / skip / skip all.
- The question shows the file it is about in red.
- Error question: retry / skip / skip all.
- Enter takes the default answer; Shift+Enter the "all" default.
- Every prompt and answer can be clicked with the mouse (OK / Cancel buttons).
- Name prompts: selection toggles between the name's stem and the whole name.
- Name prompts: full text editing, with copy / cut / paste.
- Progress box for long operations: current file bar, total bar, speed graph.
- The progress box appears only after a short delay, so fast operations do
  not flash it.
- Cancel at any time; what is already done stays done.

## Archives

- Browse zip and tar archives (gz, bz2, xz) like directories.
- Extract by copying out of an archive — same questions, same progress box.
- Pack marked entries into an archive in the other panel; the format comes
  from the name you type.
- A cancelled or failed pack deletes the half-written archive.

## Remote panels

- Connect a panel to a host over ssh; hosts come from `~/.ssh/config`.
- Type to jump in the host list.
- Copy, move and delete between local and remote, with progress in both
  directions.
- The console always stays local.

## Panel tools

- View, edit, search and compare, each an external tool you configure.
- Defaults: edx for view and edit, searchx for search, cpx for compare.
- Search results fill the panel ("panelized"); go to a hit's real directory,
  or send the other panel there.
- The search query is passed on, so view and edit open at the same match.
- Compare picks its pair itself: two marked files (from either panel), or the
  cursor entry and the same name in the other panel.
- Remote files are fetched to a temp copy for viewing.

## Quick menu

- Copy marked entries (or the cursor entry) as text: names, full paths, with
  or without size, date, permissions and owner:group, in aligned columns.
- Step the sort order.
- Pick the key set for your terminal.
- Configurable item list.

## Console: the shell

- Your own shell: `cd`, `export`, aliases and `.bash_history` all work.
- Every command runs full-screen, then ccx takes the screen back; the output
  stays in the scrollback.
- Pull ccx back over a running command; the command keeps running in the pane.
- A ccx started inside ccx's console works; the two do not confuse each other.
- A program's cursor shape (bar, block, underline) is shown by the real terminal.
- `reset` in the console also clears its scrollback and any stuck keyboard mode.
- Full-screen programs (vim, htop) work; one suspended with Ctrl+Z leaves no
  broken screen behind.
- Panel and shell stay in the same directory: moving a panel moves the shell
  silently — no echoed `cd`, no history entry — even with a half-typed line.
- When a command changes the directory, the panel follows.
- Switching panels moves the shell to that panel's directory, unless you are
  typing.
- Quitting leaves the shell in the panel's directory (cd-on-exit).
- Quit with Ctrl+D even with text on the command line.
- Keys reach programs in the console exactly as they would in the terminal
  (kitty keyboard protocol, mouse forwarding).

## Console: the command line

- ccx owns the command line: what you see is exactly what runs on Enter.
- Undo and redo.
- Editor-style editing: select by character, word, to line start/end; cut,
  copy, paste, delete; typing replaces the selection.
- Ctrl+A selects the command line; a second Ctrl+A selects all console content.
- Keys typed while a command is still starting are kept and sent in order.

## Console: history and completion

- Up shows the shell's history as a list, filtered by the typed line.
- The list holds this session's commands and the whole history file.
- Wildcards in the filter: `e*ho` finds `echo`; shown as a purple `*`.
- Enter puts the picked entry on the line; a second Enter runs it.
- Optional: typing on an empty line opens the list by itself.
- Tab completes the file name under the cursor, from a list that narrows as
  you type; `*` matches any text.
- Tab on the first word lists commands: aliases, functions, builtins,
  programs, files — each kind in its own color.
- Command names load in the background; Tab never waits.
- On a Windows drive, the file extension decides what counts as a program.

## Console: scrollback, selection and clipboard

- Scroll back by line, by half a pane, or with the mouse wheel.
- Mouse selection over output and scrollback; a drag may leave the pane.
- Click selects a word, double-click grows it to the spaces, triple-click
  selects the line.
- A selection highlights its other occurrences: green same case, olive
  other case, brighter for a whole word.
- Wrapped lines copy as one line.
- Right-click copies with a selection, pastes without one.
- Paste reads the system clipboard; optional copy-on-select.
- The selection survives a panel move.

## Keys and settings

- Every key rebindable; any Ctrl, Shift and Alt combination.
- F20..F24 work as extra modifiers while held, e.g. a remapped Caps Lock.
- Four key sets — `x`, `wt` (Windows Terminal), `terminator`, `kitty`.
- The key set is detected from the terminal, picked once, and shared by every
  WXL app; ccx warns when the set does not suit the terminal.
- F1 cheat sheet: every feature with your own keys, scrollable, with the
  build's commit.
- Settings come from command-line flags, environment variables, `config.json`
  and the shipped defaults, in that order.
- Generated example config files document every setting.
- A broken config runs ccx on defaults and shows what was wrong in a box.
- `--no-config` runs on the shipped defaults only.
- Session preferences (sort, sizes, panel height, clock, …) are saved the
  moment they change.

## Platforms and install

- Linux and WSL2.
- Native Windows, with cmd or PowerShell as the console shell.
- Shell integration with no `~/.bashrc` edit.
- Optional: start ccx in every new shell.
- Single-file binary for machines without Python; installs with one script.
- The binary installs for one user or system-wide, and uninstalls cleanly.
- License texts ship with the binary.
- `--version`, `--keys`, `--cheatsheet`, `--keyscan` for use outside the UI.
- Input trace to a log file, for bug reports.
