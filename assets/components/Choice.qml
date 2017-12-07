import bb.cascades 1.4


Container {
    id: choice
    property bool selected
    property string text
    Container {
        layout: StackLayout {
            orientation: LayoutOrientation.LeftToRight
        }
        RadioGroup {
            verticalAlignment: VerticalAlignment.Center
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1.0
            }
            Option {
                id: option     
                selected: choice.selected
            }
        }
        Label {
            text: choice.text
            verticalAlignment: VerticalAlignment.Center
            layoutProperties: StackLayoutProperties {
                spaceQuota: -1.0
            }
            textStyle.textAlign: TextAlign.Left
            textStyle.fontSize: FontSize.Medium
            multiline: true
            rightMargin: 40.0
            preferredWidth: 1400
        }
    }       
}
