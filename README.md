# aerospace-dynamic-gaps

Simple script for AeroSpace WM that adjusts outer gaps dynamically
based on the number of windows in the focused workspace.

## Why
On ultrawide (32:9) displays a single window spanning the entire width is uncomfortable to look at. 
This script increases outer gaps when only one window is present.

## How it works
The script checks the amount of windows present in a focused workspace
and increases the outer gap when there is a single window on the screen.

## Usage
Add the `exec-and-forget` command to the `on-focus-changed` callback in your `.aerospace.toml` config file

```toml
on-focus-changed = ['exec-and-forget ~/projects/aerospace-dynamic-gaps/dynamic-gaps.sh']
```

### Related projects:
- [AeroSpace](https://github.com/nikitabobko/AeroSpace)
