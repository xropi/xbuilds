# syncx

Compare two directory trees and make them the same, like Total Commander's
"Synchronize directories". A WXL app ("Sync eXperience").

```
syncx LEFT_DIR RIGHT_DIR
```

From ccx: `Shift+F3` opens syncx on the left and the right panel.

## The screen

Each line is one file or directory. The left half is the left tree, the
right half the right tree. The first line, `.` vs `.`, is the whole tree.
The middle column says what will happen:

| Symbol | Meaning                                  |
| ------ | ---------------------------------------- |
| `→`    | copy to the right                        |
| `←`    | copy to the left                         |
| `x`    | delete, shown on the side it deletes     |
| `=`    | the same on both sides                   |
| `≠`    | different                                |
| `!`    | a file on one side, a directory on other |

The middle has two columns. **stat** (grey) is the status and what syncx
suggests: the newer file, or the only copy, goes across. A dim `=` is the
same by size and date; a bright `=` is the same by content too. A
directory is `=` only when everything inside it is.

**act** (in color) is what `F5` will actually do; blank is nothing. It
starts as the suggestion; change it with `←` / `→`, `Space` (nothing) and
`Del` (delete left, right, both). An **act** you changed gets a yellow
background. A yellow `∅` means you chose nothing where syncx suggested
an action. On a directory line, the action applies to all inside it;
a line it cannot apply to does nothing (`→` on a directory clears the `←`
lines inside). A directory whose lines were set one by one shows a blank
**act**.

Colors in **act**: `→` green, `←` blue, `x` red.

## Keys

| Key                 | What                                              |
| ------------------- | ------------------------------------------------- |
| `F2` / `Enter`      | open the pair in cpx (one-sided: in the viewer)   |
| double click        | the same as `F2`                                  |
| `c`                 | compare this line by content                      |
| `F5`                | synchronize (asks first)                          |
| `F3`                | compare the trees again                           |
| `Ins` / `Ctrl+A`    | mark a line / all lines                           |
| right click / drag  | invert a line's mark / mark or unmark a run       |
| `Shift+↑` / `↓`     | the same with the keyboard, while moving          |
| `Space`             | skip the line; again: back to the suggestion      |
| `Alt+S`             | include subdirectories                            |
| `Alt+C`             | compare files of the same size by content         |
| `Alt+M`             | mirror: the right side becomes a copy of the left |
| `Alt+1` … `Alt+6`   | show / hide: `→`, `=`, `≠`, `←`, both, single     |
| `F1`                | cheat sheet                                       |
| `Esc`               | clear the marks; with none, Esc twice quits       |
| `q` / `Ctrl+Q`      | quit at once                                      |

A sync with deletes asks for `y`; Enter does nothing there. Deletes are
permanent.

## Config

`config.yml` in syncx's config folder; `example-config.yml` beside it shows
every setting. The two programs a line opens are `tools.compare` and
`tools.view`.
