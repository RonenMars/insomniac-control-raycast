# Insomniac Control for Raycast

Launch or quit [Insomniac for Mac](https://mymixapps.com/insomniac) from Raycast.
Insomniac applies its configured profiles and rules while running; launching it does not guarantee that every sleep condition is blocked.
Quitting it removes its sleep prevention, but other apps or macOS settings may still keep your Mac awake.

## Setup

Install Insomniac and Raycast on your Mac, then clone this repository and enter its directory.
Make the script executable before running:

```sh
chmod +x insomniac-toggle.sh
npm install
npm run dev
```

Run **Toggle Insomniac Sleep** in Raycast.
Assign a hotkey in Raycast Settings → Extensions if desired.
No macOS Shortcut is required.
If macOS asks Raycast for permission to control Insomniac, allow it in System Settings → Privacy & Security → Automation.

## Run the script directly

`insomniac-toggle.sh` is an alias for `insomniac-sleep.sh`.
With no argument, the script toggles whether Insomniac is running:

```sh
./insomniac-toggle.sh
./insomniac-sleep.sh disallow # launch Insomniac
./insomniac-sleep.sh allow    # quit Insomniac
```

The Raycast build bundles the same script as an asset and executes it with Bash.

## Development

The command uses Raycast’s [`no-view` mode](https://developers.raycast.com/information/manifest) and resolves its bundled script with [`environment.assetsPath`](https://developers.raycast.com/api-reference/environment).
The manifest is restricted to macOS.
Before submitting to the Raycast Store, set `author` in `package.json` to your actual Raycast Store handle; it currently assumes `RonenMars`.

```sh
npm run build
npx tsc --noEmit
bash -n insomniac-sleep.sh
```

Licensed under MIT.
