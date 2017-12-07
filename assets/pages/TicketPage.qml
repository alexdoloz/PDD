import bb.cascades 1.4
import "../components"


Page {
    actions: [
        ActionItem {
            title: "Назад"
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Вперед"
            ActionBar.placement: ActionBarPlacement.OnBar
        },
        ActionItem {
            title: "Завершить"
            ActionBar.placement: ActionBarPlacement.Signature
        }
    ]
    titleBar: TitleBar {
        title: "Билет 1, вопрос 2"
        visibility: ChromeVisibility.Overlay
    }
    ScrollView {
        Container {
            ImageView {
                imageSource: "asset:///images/PDD/01-02.jpg"
                scalingMethod: ScalingMethod.AspectFill
                preferredWidth: 1440
                preferredHeight: 0.5 * preferredWidth
            }
            Label {
                text: "Разрешен ли Вам съезд на дорогу с грунтовым покрытием?"
                textStyle.fontStyle: FontStyle.Default
                textStyle.fontWeight: FontWeight.Bold
                textStyle.fontSize: FontSize.Large
                horizontalAlignment: HorizontalAlignment.Center
                multiline: true
                textStyle.textAlign: TextAlign.Center
                leftMargin: 40.0
                rightMargin: 40.0
                layoutProperties: StackLayoutProperties {
                    spaceQuota: -1
                }
            
            }
            Divider {
            
            }
            /*
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                leftPadding: 30.0
                rightPadding: 30.0
                RadioGroup {
                    Option {}
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                }
                Label {
                    verticalAlignment: VerticalAlignment.Center
                    text: "Разрешен только при технической неисправности транспортного средства."
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: -1.0
                    }
                    textStyle.textAlign: TextAlign.Left
                    multiline: true
                    textStyle.fontSize: FontSize.Medium
                    rightMargin: 40.0
                    preferredWidth: 1440
                }
            }
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                leftPadding: 30.0
                rightPadding: 30.0
                topMargin: 20.0
                RadioGroup {
                    verticalAlignment: VerticalAlignment.Center
                    Option {}
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                }
                Label {
                    text: "Разрешен."
                    verticalAlignment: VerticalAlignment.Center
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: -1.0
                    }
                    textStyle.textAlign: TextAlign.Left
                    multiline: true
                    textStyle.fontSize: FontSize.Medium
                    rightMargin: 40.0
                    preferredWidth: 1440
                }
            }*/
            ChoiceSelection {
                options: ["Разрешен.", "Разрешен только при технической неисправности транспортного средства.", "Запрещен."]
            }
        }
    }
    
}
