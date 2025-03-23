/*
 * SPDX-FileCopyrightText: 2012 Reza Fatahilah Shah <rshah0385@kireihana.com>
 *
 * SPDX-License-Identifier: GPL-2.0-or-later
 */

import QtQuick
import QtQuick.Layouts
import org.kde.plasma.plasmoid 2.0
import org.kde.plasma.core as PlasmaCore
import org.kde.kirigami 2.20 as Kirigami
import org.kde.kquickcontrolsaddons 2.0

PlasmoidItem {
    id: mainWindow
    
    Plasmoid.backgroundHints: PlasmaCore.Types.NoBackground

    AnimatedImage { 
        id: animation
        source: "maxwell-spinning.gif"
        width: mainWindow.width
        fillMode: Image.PreserveAspectFit
        mirror: plasmoid.configuration.mirror
        // height: mainWindow.height
        speed: plasmoid.configuration.speed
        mipmap: plasmoid.configuration.highRenderQuality
    }
}


