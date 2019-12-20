import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import src.jsonformat 1.0

Rectangle{
    JsonFormat{
        id:jsonFormat
    }
    Row{
        anchors.fill: parent
        GroupBox{
            width: 0.3*parent.width
            height: parent.height
            TextEdit{
                width: parent.width
                cursorVisible: true
                id: originData
                wrapMode: Text.Wrap
                text: qsTr("text")
            }
        }
        GroupBox{
            height: parent.height
            Button{
                text: "转换"
                onClicked: {
                    jsonFormat.checkJonsStr(originData.text)
                }
            }
        }

        GroupBox{
            width: 0.6*parent.width
            height: parent.height
            TextEdit{
                width: parent.width
                id: jsonData
                wrapMode: Text.Wrap
                text: qsTr("text")
            }
        }
    }

    function formattedJson( formattedJsonData){
        console.log(formattedJsonData)
        jsonData.text=formattedJsonData
    }

    Component.onCompleted: {
        jsonFormat.formattedJson.connect(formattedJson)

    }

    Component.onDestruction: {
        jsonFormat.formattedJson.disconnect(formattedJson)
    }
}