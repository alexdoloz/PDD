import bb.cascades 1.4


Container {
    id: choice
    property alias selected: option.selected
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
            }
        }
        Container {
            layoutProperties: StackLayoutProperties {
                spaceQuota: -1.0
            }
            preferredWidth: 1400
            layout: DockLayout {
                
            }
            gestureHandlers: [
                TapHandler {
                    onTapped: {
                        selected = true
                    }
                }
            ]
            verticalAlignment: VerticalAlignment.Center
            Label {
                text: choice.text
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Left
                textStyle.textAlign: TextAlign.Left
                textStyle.fontSize: FontSize.Medium
                multiline: true
                rightMargin: 40.0
// preferredWidth: 1400
            }
        }
        
    }       
}
