import bb.cascades 1.4
import "../components"
import bb.data 1.0


Page {
    property variant tickets: []
    titleBar: TitleBar {
        title: "Экзамен"
    }
    onCreationCompleted: {
        for (var i = 1; i <= 40; i++) {
            var numberSelection = numberSelectionDefinition.createObject();
            numberSelection.number = i;
            mainContainer.add(numberSelection);
        }
        ticketDataSource.load();
    }
    function startExam(ticketIndex) {
        ticketPage.ticket = tickets[ticketIndex - 1];
        examSheet.open();
    }    
    attachedObjects: [
        DataSource {
            id: ticketDataSource
            source: "asset:///resources/tickets.json"
            onDataLoaded: {
                //var itemIndex = 1;
                //var itemIndex = 2;
                //var itemIndex = 3;
               // var itemIndex = Math.floor(Math.random() * data.length);
              //  var item = data[itemIndex];
               // ticketPage.ticket = item;
               tickets = data;
               console.log("Tickets loaded");
            }
        },
        ComponentDefinition {
            id: numberSelectionDefinition
            NumberSelection {
                gestureHandlers: [
                    TapHandler {
                        onTapped: {
                            console.log("Touch ", number);
                            startExam(number);        
                        }
                    }
                ]
            }
        },
        Sheet {
            id: examSheet
            content: TicketPage {
                id: ticketPage   
                titleBar.dismissAction: ActionItem {
                    title: "Отмена"
                    onTriggered: {
                        examSheet.close();
                    }
                }
            }
        }
    ]
    ScrollView {
        Container {
            id: mainContainer
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            layout: GridLayout {
                columnCount: 4
            }
            leftPadding: 120.0
            topPadding: 120.0
            rightPadding: 120.0
            bottomPadding: 120.0
        
        }    
    }
}
