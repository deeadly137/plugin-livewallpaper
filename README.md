# Live Wallpaper

A desktop-widget wallpaper plugin for Caelestia Shell. It renders a video or animated image above the built-in wallpaper and below normal windows.

## Requirements

- A plugin-enabled Caelestia Shell build with the `desktop-widget` entry point, such as `caelestia-shell-plugins-git`.
- Qt Multimedia support for video playback (included with the shell dependencies).

## Install

```sh
mkdir -p ~/.config/caelestia/plugins
git clone https://github.com/deeadly137/plugin-livewallpaper.git ~/.config/caelestia/plugins/plugin-livewallpaper
```

Enable the plugin in `~/.config/caelestia/plugins.json`:

```json
{
    "enabled": ["deeadly137/livewall"]
}
```

With no source configured, the plugin uses the bundled `loop.gif`.

## Configure a video or GIF

Set `source` to an absolute path:

```json
{
    "enabled": ["deeadly137/livewall"],
    "settings": {
        "deeadly137/livewall": {
            "source": "/home/deadly/Videos/wallpaper.mp4"
        }
    }
}
```

Supported video extensions are `.mp4`, `.m4v`, `.webm`, `.mkv`, `.mov`, and `.avi`. Animated GIF/WebP files are rendered with `AnimatedImage`.

The same setting will be available through the plugin settings UI once that is wired into the shell.

## Plugin details

- Manifest id: `deeadly137/livewall`
- Entry point: `desktop-widget`
- Source: `LiveWallpaper.qml`
- Settings: `settings.qml` (`source`)

## License

GPL-3.0-only. See `LICENSE`.
