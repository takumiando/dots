import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Widgets

Item {
    id: root

    property var pluginApi: null
    property ShellScreen screen
    property string widgetId: ""
    property string section: ""
    property int sectionWidgetIndex: -1
    property int sectionWidgetsCount: 0

    property string label: "?"

    implicitWidth: Style.barHeight
    implicitHeight: Style.barHeight

    function updateLabel(name) {
        name = String(name).trim()
        console.log("fcitx5 im:", name)

        if (name === "mozc") {
            label = "あ"
        } else if (name === "keyboard-us" || name.indexOf("keyboard-") === 0) {
            label = "A"
        } else if (name === "") {
            label = "?"
        } else {
            label = name
        }
    }

    NText {
        id: labelText
        anchors.centerIn: parent
        text: root.label
        color: Color.mOnSurface
        pointSize: Style.fontSizeM
        font.weight: Font.Bold
    }

    Process {
        id: fcitxQuery
        command: ["fcitx5-remote", "-n"]

        stdout: StdioCollector {
            onStreamFinished: root.updateLabel(this.text)
        }
    }

    Timer {
        interval: 250
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: fcitxQuery.exec(["fcitx5-remote", "-n"])
    }
}
