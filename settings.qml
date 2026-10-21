import Caelestia.Plugins

SettingsObject {
    property string source

    SettingMeta on source {
        label: "Video or animated image"
        description: "Absolute path to a video, GIF, or animated WebP. Use the controls in Wallpaper & style to pick one."
        inputType: SettingMeta.TextField
    }
}
