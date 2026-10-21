# Live Wallpaper

A Caelestia Shell plugin for video and animated-image wallpapers. It adds a **Live wallpaper** section to Nexus > Wallpaper & style and uses the shell's normal background renderer, so videos stay behind windows instead of being drawn as an overlay.

## Requirements

- A plugin-enabled Caelestia Shell build with `page-extension` and `desktop-widget` entry points, such as `caelestia-shell-plugins-git`.
- `ffmpeg`/`ffprobe` for the `caelestia wallpaper` CLI that generates thumbnails and validates video files.
- Qt Multimedia support for video playback (included with the shell dependencies).

## Install

Install from Nexus > Plugins (recommended), or clone it into the managed plugin directory:

```sh
mkdir -p ~/.local/share/caelestia/plugins
git clone https://github.com/deeadly137/plugin-livewallpaper.git ~/.local/share/caelestia/plugins/plugin-livewallpaper
```

Enable the plugin in `~/.config/caelestia/plugins.json`:

```json
{
    "enabled": ["deeadly137/livewall"]
}
```

## Use

1. Open Nexus > Wallpaper & style.
2. In **Live wallpaper**, choose a video, GIF, or animated WebP.
3. Use **Play wallpaper** to pause or resume playback.

Videos are passed to `Wallpapers.setWallpaper()`, which is the same path used by the normal wallpaper picker. The shell renders them through its built-in `WallpaperImpl`/`Visual` video path. GIF/WebP files additionally use an `AnimatedImage` desktop overlay because the built-in renderer only keeps the first frame for those formats.

## Settings

| Key | Type | Description |
| --- | --- | --- |
| `source` | string | Absolute path to the current live wallpaper. The page extension writes this when you pick a file. |

The source is persisted in `plugins.json`, and the normal wallpaper path is persisted by the CLI, so the live wallpaper survives shell restarts.

## Plugin details

- Manifest id: `deeadly137/livewall`
- Entry points:
  - `page-extension` (`WallpaperSettings.qml`, page `wallpaper`)
  - `desktop-widget` (`LiveWallpaper.qml`, animated-image overlay)
- Settings: `settings.qml` (`source`)

## License

GPL-3.0-only. See `LICENSE`.
