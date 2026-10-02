# hex — feature list

Everything hex can do today, one line per feature. Keys are not listed here:
`hex --keys` prints them.

## View

- Two panes side by side: hex on the left, text on the right.
- Both panes always show the same bytes on the same row.
- The text pane shows one character per byte; a newline byte never breaks
  the line.
- Bytes that are not printable show as a dim `.`.
- Offset column on the left.
- Bytes per row is configurable (a power of two, 16 by default).
- 24-bit colors, all configurable.

## Cursor and moving

- Tab switches between the hex pane and the text pane.
- The active pane has the real, blinking cursor; the other pane shows a
  still "ghost" cursor on the same byte.
- Moving in the hex pane always lands on a hex digit, never on the space
  between bytes.
- Move by byte, row, page, row start/end, file start/end.
- Cursor shape and color are configurable.

## Editing

- Overwrite bytes in place.
- In the hex pane, type hex digits: one digit per keystroke, high then low.
- In the text pane, type characters: one byte per keystroke.
- Typing at the end of the file appends bytes.
- A new, empty file can be edited from the first keystroke.

## Files

- Open a file, or a name that does not exist yet; the first save creates it.
- Save; a file with no name asks for one.
- Quitting with unsaved changes asks: save and quit, discard, or stay.

## Keys and settings

- Every key rebindable.
- Four key sets — `x`, `wt` (Windows Terminal), `terminator`, `kitty` — one
  pick shared by every WXL app.
- Settings come from command-line flags, environment variables, `config.json`
  and the shipped defaults, in that order.
- A broken config runs hex on defaults and shows what was wrong in a box.
- `--no-config` runs on the shipped defaults only.
- `--keys` and `--version` for use outside the UI.

## Platforms

- Linux and WSL2; native Windows.
- Single-file binary for machines without Python.
