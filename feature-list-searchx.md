# searchx — feature list

Everything searchx can do today, one line per feature. Keys are not listed
here: they are shown on screen next to each control.

## Searching by name

- Wildcard patterns: `*.py` matches at any depth.
- A pattern with `/` or `**` matches the path: `src/*.py`, `**/test_*.py`.
- Several patterns at once, separated by `;`.
- Regex mode instead of wildcards.
- Case-sensitive or not, for names.
- Folders match the name pattern too, shown with a trailing `/`.
- The pattern box starts with `*`, the cursor before it.

## Searching file contents

- Find text inside files, optional.
- Modes: normal, extended (`\n`, `\t`, `\xNN`) or regex.
- Whole word; case-sensitive or not, separate from the name option.
- Typing text turns the content search on; emptying the box turns it off.
- Binary files are searched too; a match shows as one "binary match" hit.

## Where it searches

- Searches the given folder, or the current one.
- Hidden files and folders: searched by default, switchable.
- Symlinked folders are not followed, so no loops and no duplicates.

## Results

- One row per match: file, line number and the line itself.
- Rows colored by file extension.
- Page through the results from anywhere, even from an input box.
- Next hit.
- View or edit the selected hit in edx, at that line, with the match
  highlighted.
- Back to ccx: jump the panel to the selected hit.
- Back to ccx: fill the panel with all hit files ("panelize"), each once.
- The search text goes along to ccx, so its view and edit open at the match.

## While searching

- The walk never freezes the screen.
- Progress: files scanned, hits, folders denied, and the file being read.
- Esc stops a long search and keeps what was found.
- Errors are shown in searchx itself, not lost.
- Focus moves to the results when there are hits, stays in the box when
  there are none.

## Input boxes

- Full text editing: caret, selection, word moves, copy / cut / paste.
- Each box keeps a history of past entries; pick one from a list.
- Tab moves between the two boxes; every control also has its own key.
- Every pattern, option and history entry is remembered between runs.

## Keys and settings

- Every key rebindable.
- Key sets for `x`, `wt` (Windows Terminal) and `terminator`; one pick shared
  by every WXL app.
- Dark and light themes.
- Settings come from command-line flags, environment variables, `config.json`
  and the shipped defaults, in that order.
- A broken config runs searchx on defaults and shows what was wrong in a box.
- `--no-config` runs on the shipped defaults only.
- `--demo-keys`: every key pressed flashes in the bottom-right corner in
  running colours, with a ring, then fades. For recordings; configurable.

## ccx and platforms

- ccx's search key opens searchx below the panel's folder.
- Works on its own too: `searchx [dir]`.
- Linux and WSL2; native Windows.
- Single-file binary for machines without Python.
