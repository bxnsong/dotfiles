## SketchyBar Setup

- Uses `sf-symbols`: `brew install --cask sf-symbols`
- Uses `jq`: `brew install jq`
- Uses `github-cli`: `brew install gh` (`gh auth login` for notifications)
- Uses [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font):

```bash
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.3/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
```

- The volume icon is an `alias`, make sure to give screen capture permission. If your system is british, you need to rename "Control Center" to "Control Centre" in `items/volume.sh`
- If you don't use yabai you can safely remove the `yabai` item from `ìtems/front_app.sh`
- (optional; needed for yabai window state and running application icons) yabai events:

```bash
yabai -m signal --add event=window_focused action="sketchybar --trigger window_focus"
yabai -m signal --add event=window_created action="sketchybar --trigger windows_on_spaces"
yabai -m signal --add event=window_destroyed action="sketchybar --trigger windows_on_spaces"
```

- (optional; needed for yabai window state and running application icons) skhd shortcuts should trigger the sketchybar events, e.g.:

```bash
lalt - space : yabai -m window --toggle float; sketchybar --trigger window_focus
shift + lalt - f : yabai -m window --toggle zoom-fullscreen; sketchybar --trigger window_focus
lalt - f : yabai -m window --toggle zoom-parent; sketchybar --trigger window_focus
shift + lalt - 1 : yabai -m window --space 1 && sketchybar --trigger windows_on_spaces
```

- (optional) update outdated packages after running brew commands (add to `.zshrc`):

```bash
function brew() {
  command brew "$@"

  if [[ $* =~ "upgrade" ]] || [[ $* =~ "update" ]] || [[ $* =~ "outdated" ]]; then
    sketchybar --trigger brew_update
  fi
}
```

NOTE: The `helper` C program is included here only to show off this specific
functionality of sketchybar and is not needed generally. It provides the data
for the cpu graph. Using a `mach_helper` provides a _much_
lower overhead solution for performance sensitive tasks, since the `helper`
talks directly to sketchybar via kernel level messages.
For most tasks (including those listed above) this difference in performance
does not matter at all.
