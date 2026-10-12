# Repository guidance

This is a no-view Raycast extension for launching or quitting Insomniac on macOS.

- Keep `insomniac-sleep.sh` as the source script; `assets/insomniac-sleep.sh` and `insomniac-toggle.sh` are symlinks to it.
- Execute the bundled script using `execFile` and `environment.assetsPath`; do not depend on a checkout path or a macOS Shortcut.
- Describe running state accurately: sleep prevention depends on Insomniac profiles and rules.
- Validate changes with `npm run build`, `npx tsc --noEmit`, and `bash -n insomniac-sleep.sh`.
- Use mocked macOS commands for automated script checks; do not launch or quit the user's app during tests.
