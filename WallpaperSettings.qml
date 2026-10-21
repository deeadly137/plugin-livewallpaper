pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import Caelestia.Config
import Caelestia.I18n
import Caelestia.Plugins
import Caelestia.State
import qs.components
import qs.components.filedialog
import qs.services
import qs.modules.nexus.common

// Page extension for Nexus > Wallpaper & style. The shell's normal background renderer already
// supports video files, so applying a source here gives a real wallpaper that stays behind windows
// instead of a full-screen overlay.
ColumnLayout {
    id: root

    required property SettingsObject settings

    readonly property string currentName: Wallpapers.actualCurrent ? Wallpapers.actualCurrent.split("/").pop() : ""

    spacing: Tokens.spacing.extraSmall / 2

    SectionHeader {
        text: Tr.tr("Live wallpaper")
    }

    RowButton {
        first: true
        icon: "video_file"
        text: Tr.tr("Video or animated image")
        subtext: root.settings.source || Tr.tr("None selected")
        trailingIcon: "folder_open"
        onClicked: picker.open()
    }

    ToggleRow {
        last: true
        text: Tr.tr("Play wallpaper")
        subtext: Tr.tr("Pause playback without changing the wallpaper")
        checked: PersistentState.wallpaperPlaying
        onToggled: PersistentState.wallpaperPlaying = checked
    }

    StyledText {
        Layout.fillWidth: true
        Layout.topMargin: Tokens.spacing.small
        Layout.leftMargin: Tokens.padding.small
        text: root.currentName ? Tr.tr("Current wallpaper: %1").arg(root.currentName) : Tr.tr("Using the default wallpaper")
        color: Colours.palette.m3outline
        font: Tokens.font.label.small
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }

    FileDialog {
        id: picker

        title: Tr.tr("Choose a live wallpaper")
        filterLabel: Tr.tr("Videos and animated images")
        filters: ["mp4", "webm", "mkv", "mov", "gif", "webp"]
        onAccepted: path => {
            root.settings.source = path;
            Wallpapers.setWallpaper(path);
        }
    }
}
