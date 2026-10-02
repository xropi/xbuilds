# edx — feature list

Everything edx can do today, one line per feature. Keys are not listed here:
press F1 in edx, or see `README.md`.

## Files and tabs

- Open several files at once, one tab each.
- New unnamed buffer in a new tab.
- Switch tabs by key, by position (1 to 9), or with the mouse.
- Open a file through a ccx-style file panel; type to jump to a name.
- Recent files, in the File menu; each opens in its own tab.
- Save; save as; save all tabs.
- Quitting asks about each unsaved tab, with Save all / None answers.
- Close a tab; closing the last one quits.
- Reload a file that changed on disk; edx notices by itself and asks.
- Open at a line: `file:34` on the command line.
- Open at the first match of a search string.
- Read-only viewer mode.
- Re-read the config without restarting.
- Esc twice quits: the first Esc drops carets, selection and search highlight
  in turn; when nothing is left, the text flashes red and a second Esc quits.

## Screen

- Title row: the full path with the file name in a strong style, then the
  date and time.
- Red X in the top-right corner quits.
- Proportional, draggable scrollbar on the right.
- Git changes in a strip beside the scrollbar.
- Lines edited since the last save have a lighter line number.
- Wrap long lines on or off; remembered between sessions.
- Big seven-segment clock over the text's corner; remembered between sessions.
- The caret's row is lifted with a lighter background.
- The caret is painted by edx, so its blink is steady while you type.
- Caret shape and color are configurable; overwrite mode shows a red caret.
- The clocks tick steadily, even when the system clock is adjusted a little.
- Roast lines scroll through the top or bottom row; pick their topics.
- The author's name and a DONATE button on the cheat sheet's bottom rule.

## Effects

- Focus wave: a moving color wave on the caret's row, the title, the status
  row, the scrollbar and the big clock shows that edx has focus.
- The wave is fully configurable: shape, length, speed, colors, strength,
  in layers.
- Typing ripple: a ring around the caret on every key, one look per kind of
  key (typing, deleting, undo, moving).
- Wrap-around alarm: a wave front over the text when a search wraps.
- A ring from the centre on every focus change; inward when edx loses focus.
- A ring at every mouse click.
- `--demo-keys`: every key pressed, mouse click and wheel step flashes in
  the bottom-right corner in running colours, with a ring, then fades. For
  recordings; configurable.

## Moving and the view

- Move by character, word, line, page, document.
- Jump to the matching bracket, angle brackets included; the pair is
  highlighted, and an off-screen partner is named on the status row.
- Scroll without moving the caret; the caret is pulled along only when it
  would leave the screen.
- Scroll sideways, by Ctrl+wheel or key.
- Pan: drag the document with the middle mouse button.
- Search and marker jumps put the caret a quarter down the screen, or do not
  scroll at all when it is visible.
- A jump to a named line centers the view.
- Line markers: mark lines, jump to the next or previous one.

## Selecting

- Select while moving: by character, word, line end, page, document.
- Select all.
- Mouse: click places the caret, drag selects, double-click a word,
  triple-click a line.
- Up/Down with a selection first collapse to its edge.
- The other occurrences of the selection light up.
- The other matches of the word at the caret light up.
- These highlights show by color whether a match has the same case and
  whether it is a whole word; a whitespace-only selection highlights nothing.

## Editing

- Windows-style keys: no modes, no commands to learn.
- Undo and redo.
- Insert / overwrite mode.
- Auto-indent: a new line keeps the indent above.
- Tab width and tabs-vs-spaces are read from the file itself; config is the
  fallback.
- Indent and dedent the selected lines.
- Delete a word before or after the caret; deleting forward also eats the
  space after the word.
- Duplicate the line, the selected lines, or a one-line selection.
- Delete the line or the selected lines.
- Move the line or the selected lines up or down.
- Toggle upper / lower case of the selection or the word.
- Toggle snake_case / camelCase of the selection or the word.
- Convert the text to ASCII.
- Line endings: LF or CRLF.
- Normalize indentation.
- Format on save with clang-format, when a `.clang-format` is found above the file.
- Shift+Backspace / Shift+Delete / Shift+Enter act like the plain keys.

## Several carets

- Stack carets on many lines; type, delete and paste at all of them.
- The stack grows and shrinks at its bottom.
- Paste with as many lines as carets puts one line at each caret.
- Works in the viewer too.

## Clipboard

- Copy, cut, paste with the usual keys.
- Copy with no selection copies the word at the caret.
- Copy also reaches the system clipboard, through the terminal.
- Right-click copies with a selection, pastes the system clipboard without one.

## Search and replace

- Search as you type, in a box on the bottom row.
- Starts with the selection or the word at the caret, else the last search.
- Options: case-sensitive, whole word, escapes (`\n`, `\t`, `\xHH`), regex;
  always visible, remembered between sessions.
- Next / previous match, also from inside the box.
- A search wraps around the end, with an alarm.
- Past searches are listed above the box, filtered by what you type.
- The next edx run continues the last search.
- Full text editing in the box, with copy / cut / paste.
- Replace dialog: find and replace fields; replace one and go on, or
  replace all.
- Replace in the whole file or only in the selection.

## Completion

- Complete the word before the caret from the words of the open file.
- Matching ignores case and `_` by default; both switchable in the list.

## Syntax highlighting

- Syntax highlighting for most languages, in 24-bit color.
- Preprocessor lines (`#include`, …) have their own colors.
- Highlighting stays fast on big files: only the edited part is re-read.

## C and C++ (needs clangd)

- Go to a definition, in a second edx that says it is one and how to get back.
- Look up the name at the caret and read its documentation.
- Insert a name's declaration as a fillable block below.
- The signature of the call around the caret, all overloads; the chosen one
  fills in its parameters.
- List what fits at the caret — members after `.` or `->`, and more; opens
  by itself on `.`, `->`, `::`, `(` or `{`.
- Errors and warnings marked in the text, by themselves a second after you
  stop typing, or on request.
- Step through the problems of a row, error first.
- Errors from included files are left out by default.
- One resident clangd per project, warmed up when a file opens.
- The `compile_commands.json` is named on the command line, in the config or
  in an environment variable, or searched for upwards.

## Git

- Compare the file with the last git commit, side by side in cpx.

## Menu

- File / Edit / Code / View menu over the title row, each row with its key.
- Open a menu directly with Alt and its letter; pick a row by its letter.

## Keys and settings

- Every key rebindable; any Ctrl, Shift and Alt combination.
- F20..F24 work as extra modifiers while held, e.g. a remapped Caps Lock.
- Four key sets — `x`, `wt` (Windows Terminal), `terminator`, `kitty`.
- The key set is detected from the terminal, picked once, and shared by every
  WXL app; edx warns when the set does not suit the terminal.
- F1 cheat sheet: every feature with your own keys, scrollable, with the
  build's commit.
- Questions on the status row can be answered by key or with the mouse.
- Settings come from command-line flags, environment variables, `config.json`
  and the shipped defaults, in that order; edx names the variables in force.
- Generated example config files document every setting.
- A broken config runs edx on defaults and shows what was wrong in a box.
- `--no-config` runs on the shipped defaults only.
- The mouse can be turned off, giving selection back to the terminal.

## ccx and other apps

- The viewer and editor behind ccx's F3 and F4.
- Opens at the match a searchx search found.
- Can be hosted inside another app: trx's two panels are edx editors.
- Runs at full fidelity inside ccx's console.

## Platforms and install

- Linux and WSL2.
- Native Windows.
- Single-file binary for machines without Python; installs with one script,
  `cppdoc` included.
- The binary installs for one user or system-wide, and uninstalls cleanly.
- License texts ship with the binary.
- `--version`, `--keys`, `--cheatsheet`, `--keyscan` for use outside the UI.
