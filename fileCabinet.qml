import QtQuick 2.10
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import QtQml 2.0


ApplicationWindow{
    title: qsTr("NEUROPATHIC VIEW")
    width: 1024
    height: 768
    id: root
    property int listInt: -1
    Rectangle {
        anchors.fill: parent
        color: white
        Rectangle {
            x: 0
            y: 0
            width: 1024
            height: 163
            //rotation: 270
            visible: true
            border.color: "#ffffff"

            gradient: Gradient {
                GradientStop { position: 0; color: "#3d1d5c"}
                GradientStop { position: 1; color: "#337cb6"}
            }


        }
            Rectangle {
                id: rectangleCentral
                x: 27
                y: 204
                width: 969
                height: 450
                radius: 3
                gradient: Gradient {
                    GradientStop {position: 0; color: "#901c3b"}
                    GradientStop {position: 1; color: "#e13f52"}
                }

                Component {
                    id: delegate
                    // onclicked with a delegate model, work out
                    // the details for the release edition. Page
                    // 89 on the pdf
                    Item {
                      width: 200
                      height: 28

                      Row{
                          topPadding: 40
                          leftPadding : 10
                          spacing: 20
                          bottomPadding: 40
                          Text {
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              width: 300
                              text: First + " " + Last
                              font.pointSize: 15
                              color: "white"
                          }
                          Text {
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              width: 300
                              text: ID
                              font.pointSize: 15
                              color: "white"
                          }
                          Text {
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              width: 300
                              text: DateY + "-" + DateM + "-" + DateD
                              font.pointSize: 15
                              color: "white"
                          }
                      }

                    }
                }
                Component {
                    id: delegate0
                    // onclicked with a delegate model, work out
                    // the details for the release edition. Page
                    // 89 on the pdf
                    Item {
                      width: 300
                      height: 50

                      Row{
                          topPadding: 50
                          leftPadding : 50
                          spacing: 10
                          bottomPadding: 50
                          Text {
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              width: 50
                              text: num
                              font.pointSize: 15
                              color: "black"
                          }
                          Text {
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              width: 400
                              text: First + " " + Last
                              font.pointSize: 15
                              color: "black"
                          }

                          Text {
                              verticalAlignment: Text.AlignVCenter
                              horizontalAlignment: Text.AlignHCenter
                              width: 150
                              text: DateY + "-" + DateM + "-" + DateD
                              font.pointSize: 15
                              color: "black"
                          }
                          RoundButton {
                              id: removeModel
                              width: 100
                              height: 40
                              radius: 5
                              text: qsTr("remove me")
                              font.bold: true
                              font.pointSize: 12
                              highlighted: true
                              onClicked: {
                                 delegate0.model.remove(num)
                                  //bruh dont work
                                 listInt = listInt - 1
                              }
                          }
                      }

                    }
                }
                ListView {
                    anchors.fill: parent
                    model: model
                    delegate: delegate
                  }

                  ListModel {
                    id: model
                  }

        }
            RoundButton {
                id: exitSys
                x: 817
                y: 663
                width: 180
                height: 70
                radius: 5
                text: qsTr("Exit System")
                leftPadding: 10
                highlighted: true
               // onClicked:                          // future functionality
            }

            Image {
                id: logo
                x: 25
                y: 13
                width: 272
                height: 90
                source: "logo-lluh_0.png"
                fillMode: Image.PreserveAspectFit
            }
            RoundButton {
                id: addPatient
                x: 631
                y: 663
                width: 180
                height: 70
                radius: 5
                text: qsTr("Add Patient")
                leftPadding: 10
                onClicked: popupAdd.open()
            }
            Popup{
                id: popupAdd
                x: 400
                y: 200
                width: 10
                height:10
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                Rectangle {
                    id: contentAdd
                    x: -175
                    y: -40
                    width: 580
                    height: 260
                    radius: 5
                    visible: true
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    Label{
                        text: "Enter Patient Name Below"
                        font.family: "Tahoma"
                        font.bold: true
                        font.pointSize: 18
                        color: "white"
                        x: 125
                        y: 20

                        font.styleName: "Regular"

                        //font.pointSize: 36
                        //anchors.horizontalCenterOffset: 0
                        //rotation: 0
                    }
                    Label{
                        text: "Please fill in both fields"
                        font.family: "Tahoma"
                        font.styleName: "Regular"
                        font.bold: true
                        font.pointSize: 18
                        color: "black"
                        style: Text.Outline
                        styleColor: "red"
                        x: 145
                        y: 45
                        visible: false
                        id: fieldWarning

                    }
                    TextField {
                        id: firstNameField
                        x: 15
                        y: 80
                        width: 270
                        height: 70
                        placeholderText: qsTr("First Name")
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                    }
                    TextField {
                        id: lastNameField
                        x: 290
                        y: 80
                        width: 270
                        height: 70
                        placeholderText: qsTr("Last Name")
                        horizontalAlignment: TextInput.AlignHCenter
                        verticalAlignment: TextInput.AlignVCenter
                    }
                    RoundButton {
                        id: confirmButton
                        x: 290
                        y: 170
                        width: 270
                        height: 70
                        radius: 5
                        text: qsTr("Confirm Add")
                        leftPadding: 10
                        onClicked: {
                            if ((firstNameField.text && lastNameField.text) !== ""){
                                    listInt = listInt + 1
                                    exitSys.text = listInt
                                    var date = new Date().toLocaleDateString(locale, "dd.MM.yyyy")
                                    var time = new Date().toLocaleTimeString(locale, "hh:mm:ss.zzz")
                                    var day = date[0] + date[1]
                                    var month =  date[3] + date[4]
                                    var year = date[6] + date[7] + date[8] + date[9]
                                    var countms = time[1] +time[9] + time[10] + time[11]
                                    var counts = time[6] + time[7]
                                    var countm = time[3] + time[4]
                                    var id = ("000" + listInt).slice(-4) + "-" + month + countm + "-"  + day + counts + "-" + countms
                                    model.append({"First": firstNameField.text, "Last": lastNameField.text, DateM: month, "DateY": year, "DateD": day, "ID": id, "num": listInt})
                                    firstNameField.text = ""
                                    lastNameField.text = ""
                                    scanOptions.open()
                                    popupAdd.close()
                            }
                            else{
                                fieldWarning.visible = true
                            }
                        }
                    }
                    RoundButton {
                        id: bailButton
                        x: 15
                        y: 170
                        width: 270
                        height: 70
                        radius: 5
                        text: qsTr("Cancel Add")
                        leftPadding: 10
                        onClicked: popupAdd.close()
                    }
                }
            }
            Popup{
                id: scanOptions
                x: 165
                y: 165
                width: 700
                height:400
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                Rectangle {
                    id: scanOptionsTitle
                    x: 160
                    y: 0
                    width: 380
                    height: 100
                    radius: 5
                    visible: true
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    Label{
                        text: "Select a Test to Run"
                        font.bold: true
                        font.pointSize: 18
                        color: "black"
                        anchors.centerIn: parent

                    }

                }
                Rectangle {
                    id: optionsMenu
                    x: 15
                    y: 110
                    width: 650
                    height: 280
                    radius: 5
                    visible: true
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    RoundButton {
                        id: sSA
                        x: 10
                        y: 10
                        width: 310
                        height: 80
                        visible: true
                        radius: 5
                        text: qsTr("Single side assessment")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        layer.enabled: false
                        anchors.horizontalCenter: parent
                        onClicked: {
                            scanPopup.open()
                            scanOptions.close()

                        }
                    }
                    RoundButton {
                        id: fT
                        x: 330
                        y: 10
                        width: 310
                        height: 80
                        radius: 5
                        //color: '#3d1d5c'
                        text: qsTr("Food test")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        onClicked: {
                            scanPopup.open()
                            scanOptions.close()
                            //----------------------------------------------------------------------------------------------------------------------------------------

                        }
                    }
                    RoundButton {
                        id: nIn
                        x: 10
                        y: 100
                        width: 310
                        height: 80
                        radius: 5
                        text: qsTr("Neurovascular index – Normal")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        onClicked: {
                            scanPopup.open()
                            scanOptions.close()
                        }
                    }
                    RoundButton {
                        id: nIe
                        x: 330
                        y: 100
                        width: 310
                        height: 80
                        radius: 5
                        text: qsTr("Neurovascular index – Expanded")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        onClicked: {
                            scanPopup.open()
                            scanOptions.close()
                        }
                    }
                    RoundButton {
                        id: nIlFo
                        x: 10
                        y: 190
                        width: 310
                        height: 80
                        radius: 5
                        text: qsTr("Neurovascular index- Large Fiber Only")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        onClicked: {
                            scanPopup.open()
                            scanOptions.close()
                        }
                    }
                    RoundButton {
                        id: nIb
                        x: 330
                        y: 190
                        width: 310
                        height: 80
                        radius: 5
                        text: qsTr("Neurovascular index – Back")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        onClicked: {
                            scanPopup.open()
                            scanOptions.close()
                        }
                    }

                }
                RoundButton {
                    id: bailoutScan
                    x: 600
                    y: 10
                    width: 50
                    height: 50
                    radius: 5
                    text: qsTr("X")
                    font.bold: true
                    font.pointSize: 12
                    highlighted: true
                    onClicked: {
                        model.remove(listInt)
                        listInt = listInt - 1
                        exitSys.text = listInt
                        scanOptions.close()
                    }
                }
            }

            RoundButton {
                id: goBack
                x: 27
                y: 663
                width: 180
                height: 70
                radius: 5
                text: qsTr("Return")
                leftPadding: 10
            }
            Popup{
                id: scanPopup
                width: 1024
                height: 605
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                onClosed: windowName.visible = true
                onOpened: windowName.visible = false
                x: 0
                y: 162
                Rectangle {
                    id: nameBorder
                    x: 60
                    y: 45
                    width: 380
                    height: 66
                    radius: 5
                    visible: true
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    Label{
                        id: artery
                        text: qsTr("Begin Scan:")
                        font.family: "Segou UI"
                        font.pointSize: 18
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
                Rectangle {
                    id: rectangle1
                    x: 120
                    y: 175
                    width: 57
                    height: 138
                    rotation: 270
                    radius: 5
                    gradient: Gradient {
                        GradientStop {position: 0; color: "#901c3b"}
                        GradientStop {position: 1; color: "#e13f52"}
                    }
                    Label{
                        id: model0
                        text: ""
                        font.family: "Segou UI"
                        font.pointSize: 18
                        color: "white"
                        anchors.centerIn: parent
                        rotation: 90
                    }
                }
                Rectangle {
                    id: rectangle2
                    x: 310
                    y: 175
                    width: 57
                    height: 138
                    rotation: 270
                    radius: 5
                    gradient: Gradient {
                        GradientStop {position: 0; color: "#901c3b"}
                        GradientStop {position: 1; color: "#e13f52"}
                    }
                    Label{
                        id: model1
                        text: ""
                        font.family: "Segou UI"
                        font.pointSize: 18
                        color: "white"
                        anchors.centerIn: parent
                        rotation: 90
                    }
                }
                Rectangle {
                    id: rectangle3
                    x: 120
                    y: 322
                    width: 57
                    height: 138
                    rotation: 270
                    radius: 5
                    gradient: Gradient {
                        GradientStop {position: 0; color: "#901c3b"}
                        GradientStop {position: 1; color: "#e13f52"}
                    }
                    TextEdit{
                        id: edit0
                        text: " "
                        font.family: "Segou UI"
                        font.pointSize: 18
                        color: "white"
                        anchors.centerIn: parent
                        rotation: 90
                        focus: true
                    }
                }
                Rectangle {
                    id: rectangle4
                    x: 310
                    y: 322
                    width: 57
                    height: 138
                    rotation: 270
                    radius: 5
                    gradient: Gradient {
                        GradientStop {position: 0; color: "#901c3b"}
                        GradientStop {position: 1; color: "#e13f52"}
                    }
                    TextEdit{
                        id: edit1
                        text: " "
                        font.family: "Segou UI"
                        font.pointSize: 18
                        color: "white"
                        anchors.centerIn: parent
                        rotation: 90
                        focus: true
                    }
                }
                Rectangle {
                    id: rectangleanatomy
                    x: 600
                    y: 45
                    width: 330
                    height: 375
                    radius: 5
                    state: ""
                    gradient: Gradient {
                        GradientStop {position: 0; color: "#901c3b"}
                        GradientStop {position: 1; color: "#e13f52"}
                    }
                    Image {
                        id: anatonmyView
                        anchors.centerIn: parent
                        width: 330
                        height: 330
                        source: "chest.png"
                        fillMode: Image.PreserveAspectFit
                    }

                }
                RoundButton {
                    id: continueOn
                    x: 60
                    y: 517
                    width: 447
                    height: 80
                    visible: true
                    radius: 5
                    text: qsTr("CONTINUE")
                    flat: true
                    font.bold: true
                    font.pointSize: 12
                    leftPadding: 10
                    highlighted: true
                    layer.enabled: false
                    onClicked: {
                        var text0 = String(Math.floor(Math.random() * (999 - 100) ) + 100);
                        var text1 = String(Math.floor(Math.random() * (999 - 100) ) + 100);
                        model0.text =  text0[0] + "." + text0[1] + text0[2]
                        model1.text =  text1[0] + "." + text1[1] + text1[2]
                        edit0.text = " "
                        edit1.text = " "
                        // swap for scan data in future functionality
                    }

                }
                RoundButton {
                    id: mainMenu
                    x: 513
                    y: 517
                    width: 447
                    height: 80
                    radius: 5
                    text: qsTr("FILE CABINET")
                    flat: true
                    font.bold: true
                    font.pointSize: 12
                    leftPadding: 10
                    highlighted: true
                    onClicked: scanPopup.close()
                }


            }
            RoundButton {
                id: nextScreen
                x: 27
                y: 167
                width: 102
                height: 35
                radius: 5
                text: qsTr("Continue")
                leftPadding: 10
            }

            ComboBox {
                id: searchTerms
                x: 133
                y: 167
                width: 142
                height: 35
                model: ListModel {
                    id: cbItems
                    ListElement { text: "Patient Name" }
                    ListElement { text: "Patient ID" }
                }
                flat: true
                leftPadding: 10
            }
            RoundButton {
                id: utilities
                x: 854
                y: 167
                radius: 3
                width: 142
                height: 35
                text: qsTr("Utilities")
                leftPadding: 10
                onClicked: popupUtil.open()
            }
            Popup{
                id: popupUtil
                x: 300
                y: 163
                width: 420
                height: 400
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                Rectangle {
                    id: utilTitle
                    x: 10
                    y: 0
                    width: 380
                    height: 100
                    radius: 5
                    visible: true
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    Label{
                        text: "Select an option below"
                        font.bold: true
                        font.pointSize: 18
                        color: "black"
                        anchors.centerIn: parent

                    }
                }
                Rectangle {
                    id: utilMenu
                    x: 10
                    y: 110
                    width: 380
                    height: 280
                    radius: 5
                    visible: true
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    RoundButton {
                        id: repairDB
                        x: 15
                        y: 10
                        width: 350
                        height: 80
                        visible: true
                        radius: 5
                        text: qsTr("Run DB Repair")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        layer.enabled: false
                        anchors.horizontalCenter: parent
                        onClicked: {
                            popupComp.open()
                        }
                    }
                    RoundButton {
                        id: removePat
                        x: 15
                        y: 100
                        width: 350
                        height: 80
                        visible: true
                        radius: 5
                        text: qsTr("Remove Patients")
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        layer.enabled: false
                        anchors.horizontalCenter: parent
                        onClicked: {
                            popupRemove.open()
                        }
                    }

                    RoundButton {
                        id: bailUtil
                        x: 15
                        y: 190
                        width: 350
                        height: 80
                        visible: true
                        radius: 5
                        text: qsTr("Close menu")
                        palette.buttonText: "red"
                        font.bold: true
                        font.pointSize: 12
                        leftPadding: 10
                        highlighted: true
                        layer.enabled: false
                        anchors.horizontalCenter: parent
                        onClicked: {
                            popupUtil.close()
                        }
                    }
                    Popup{
                        id: popupComp
                        x: 0
                        y: 0
                        width: 380
                        height:200
                        modal: true
                        focus: true
                        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                        Label{
                            x: 85
                            text: "Repair Successful!"
                            font.bold: true
                            font.pointSize: 18
                            color: "black"
                        }
                        RoundButton {
                            id: bailComp
                            x: 10
                            y: 50
                            width: 350
                            height: 80
                            radius: 5
                            text: qsTr("Close Screen")
                            font.bold: true
                            font.pointSize: 12
                            highlighted: true
                            onClicked: {
                                popupComp.close()
                            }
                        }
                    }
                }
            }

            Popup{
                id: popupRemove
                x: 0
                y: 163
                width: 1024
                height:500
                modal: true
                focus: true
                closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent
                Label{
                    x: 20
                    y: 20
                    text: "Select a Patient to Remove"
                    font.bold: true
                    font.pointSize: 24
                    color: "black"
                }
                RoundButton {
                    id: bailRemove
                    x: 944
                    y: 5
                    width: 50
                    height: 50
                    radius: 5
                    text: qsTr("X")
                    font.bold: true
                    font.pointSize: 12
                    highlighted: true
                    onClicked: {
                        popupRemove.close()
                    }
                }
                Rectangle{
                    x: 20
                    y: 60
                    width: 974
                    height: 380
                    gradient: Gradient {
                        GradientStop { position: 0; color: "#901c3b"}
                        GradientStop { position: 1; color: "#e13f52"}
                    }
                    ListView {
                        anchors.fill: parent
                        model: model
                        delegate: delegate0
                      }
                }


            }

            TextField {
                id: textField
                x: 280
                y: 167
                width: 199
                height: 35
                placeholderText: qsTr("Search")
                horizontalAlignment: TextInput.AlignHCenter
                verticalAlignment: TextInput.AlignVCenter
            }


            Rectangle{
                id: patName
                x: 27
                y: 204
                width: 302
                height: 35
                radius: 3
                color: "#e1e1e2"
                visible: true
                border.color: "#000000"
                Text{
                    text: qsTr("Patient Name")
                    anchors.centerIn: parent
                }

            }
            Rectangle {
                id: patId
                x: 328
                y: 204
                width: 350
                height: 35
                radius: 3
                color: "#e1e1e2"
                visible: true
                border.color: "#000000"
                Text {
                    text: qsTr("Patient ID")
                    anchors.centerIn: parent
                }

            }

            Rectangle {
                id: scanHistory
                x: 677
                y: 204
                width: 319
                height: 35
                radius: 3
                color: "#e1e1e2"
                visible: true
                border.color: "#000000"
                Text {
                    text: qsTr("Scan History")
                    anchors.centerIn: parent
                }

            }


            Text {
                id: windowName
                width: 322
                height: 61
                color: "#ffffff"
                text: qsTr("FILE CABINET")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.styleName: "Regular"
                anchors.verticalCenterOffset: -326
                font.pointSize: 36
                anchors.horizontalCenterOffset: 0
                rotation: 0
                font.family: "Tahoma"
                anchors.centerIn: parent

            }
    }

}
