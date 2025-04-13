import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
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
}