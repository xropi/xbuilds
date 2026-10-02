# cpx — feature list

Everything cpx can do today, one line per feature. Keys are not listed here:
press F1 in cpx.

## Comparing

- Two files side by side; differences highlighted line by line.
- Inside a changed line, the differing characters are highlighted too.
- Gaps on one side keep matching lines level across the two panes.
- Next / previous difference.
- Case-sensitive or not; ignore whitespace or not — both remembered between runs.
- Line endings are ignored for the comparison; when the files differ in
  line endings (CRLF / LF / mixed), the status row says so.
- Identical files: a box says so at start, with the reason when they are
  equal only by the options; Enter or Esc quits.
- Binary files are refused with a message, never shown as garbage.
- A file in a broken encoding still opens.
- Control characters are shown safely, never sent to the terminal.

## Resync

- Pin a line on the left to a line on the right, and recompare around the pair.
- Each pane has its own line cursor; set one, scroll, set the other, then resync.
- Several resync points at once; a new one drops the ones it contradicts,
  and the status row says how many.
- Reset: drop every resync point and compare from scratch.
- Recompare with the current resync points and options.

## View

- One shared vertical and one shared horizontal scroll, so the two sides
  always stay level.
- Scroll without moving the cursors.
- Scroll sideways, by a column or by a chunk; back to column 1.
- No line wrapping, on purpose: long lines are read by scrolling sideways.
- Proportional, draggable scrollbar.
- Real file line numbers in each pane's gutter.
- Button row: every button is a real key, labelled with your own key.
- Red X in the top-right corner quits.

## Mouse

- Click a line: activates that pane and sets its resync cursor.
- Wheel scrolls; Alt+wheel scrolls sideways.
- Click a button to press it.
- In view mode, the terminal's own selection copies text.

## Edit mode

- Turn edit mode on and off; both files are editable at once.
- A caret and a selection in each pane; switch panes to type in the other.
- Typing into a gap inserts the line into that file at that place.
- Enter splits a line and opens a gap on the other side.
- Copy the selected rows (or the caret's row) to the left or the right pane.
- Select by character, word, line end, page, whole pane; by mouse drag.
- Copy, cut, paste; right-click copies a selection or pastes.
- Undo and redo.
- The comparison is frozen while you edit, and the status row says it is
  stale; a recompare rebuilds it around the edited text.
- A row whose two sides become equal is shown as equal at once.
- Resync points move with the edits; new ones cannot be set while editing.
- A file that did not decode cleanly can be viewed but not edited.

## Saving

- Save the pane you are in.
- On quit: asked only about files that really changed — typing and undoing
  asks nothing. Save both / left / right / don't save / cancel.
- A changed file is marked with `*` before its path.
- Each file keeps its line endings and its trailing newline; a mixed-ending
  file is warned about before saving.
- Saving is atomic: a failed write leaves the original intact and cancels the quit.

## Keys and settings

- Every key rebindable.
- Four key sets — `x`, `wt` (Windows Terminal), `terminator`, `kitty` — one
  pick shared by every WXL app; cpx warns when the set does not suit the terminal.
- F1 cheat sheet: every feature with your own keys.
- Settings come from command-line flags, environment variables, `config.json`
  and the shipped defaults, in that order.
- A broken config runs cpx on defaults and shows what was wrong in a box.
- `--no-config` runs on the shipped defaults only.
- `--demo-keys`: every key pressed, mouse click and wheel step flashes in
  the bottom-right corner in running colours, with a ring, then fades. For
  recordings; configurable.

## ccx and platforms

- ccx's compare key opens cpx on two files.
- Linux and WSL2; native Windows.
- Single-file binary for machines without Python.
