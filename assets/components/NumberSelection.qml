import bb.cascades 1.4


Container {
    property int number
    horizontalAlignment: HorizontalAlignment.Center
    verticalAlignment: VerticalAlignment.Center
    layout: DockLayout {
        
    }
    Container {
        background: Color.DarkGray
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill
    }
    
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        verticalAlignment: VerticalAlignment.Fill

        leftPadding: 5.0
        topPadding: 5.0
        rightPadding: 5.0
        bottomPadding: 5.0
        Container {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Center
            background: Color.LightGray
            property double dimension: 200
            minHeight: dimension
            maxHeight: dimension
            minWidth: dimension
            maxWidth: dimension
            layout: DockLayout {
                
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                text: "" + number
                textStyle.textAlign: TextAlign.Center
                textStyle.fontWeight: FontWeight.W500
                textStyle.fontSize: FontSize.Large
                textStyle.fontStyle: FontStyle.Italic
                textStyle.color: Color.White

            }    
        }   
    }
    
        
}
