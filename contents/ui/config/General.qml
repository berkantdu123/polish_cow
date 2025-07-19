import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Dialogs
import org.kde.kirigami as Kirigami
import org.kde.kcmutils as KCM
import QtQuick.Dialogs as QtDialogs

Kirigami.FormLayout {
    id: page

    property alias cfg_speed: speed.value
    property alias cfg_mirror: mirror.checked
    property alias cfg_hq: hq.checked
    property var cfg_playthemesong
    property alias cfg_themesongloops: themesongloops.value
    property alias cfg_gifpath: gifpath.text
    property var cfg_gifpathDefault

    Slider {
        id: speed

        Layout.preferredWidth: 15 * Kirigami.Units.gridUnit
        from: 0.6
        to: 10
        stepSize: 0.4
        Kirigami.FormData.label: i18n("Speed")
    }

    CheckBox {
        id: mirror

        Kirigami.FormData.label: i18n("Mirror")
    }

    CheckBox {
        id: hq

        Kirigami.FormData.label: i18n("High render quality")
    }

    ComboBox {
        id: playthemesong
        model: ["Never", "On Click", "On Double Click"]
        Kirigami.FormData.label: i18n("Play/Stop theme song")
        
        Component.onCompleted: {
            const selectedIndex = playthemesong.find(cfg_playthemesong)
            playthemesong.currentIndex = selectedIndex != -1 ? selectedIndex : 0
        }
 
        onActivated: {
            cfg_playthemesong = currentValue
        }
    }

    SpinBox {
        id: themesongloops
        enabled: cfg_playthemesong != "Never"
        from: 1

        Kirigami.FormData.label: i18n("Theme song loops")
    }

    RowLayout {
        Kirigami.FormData.label: i18n("Path to GIF:")

        TextField {
            id: gifpath
            placeholderText: i18n("No file selected.")
        }
        Button {
            text: i18n("Browse")
            icon.name: "folder-symbolic"
            onClicked: fileDialogLoader.active = true

            Loader {
                id: fileDialogLoader
                active: false

                sourceComponent: FileDialog {
                    id: fileDialog
                    nameFilters: [
                        i18n("GIF", "*.gif"),
                        i18n("All files (%1)", "*"),
                    ]
                    onAccepted: {
                        gifpath.text = fileDialog.selectedFile
                        fileDialogLoader.active = false
                    }
                    onRejected: {
                        fileDialogLoader.active = false
                    }
                    Component.onCompleted: open()
                }
            }
        }
        Button {
            text: i18n("Reset default")
            icon.name: "edit-reset"
            onClicked: gifpath.text = cfg_gifpathDefault
        }
    }

}