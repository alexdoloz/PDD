import bb.cascades 1.4
import "../components"


Page {
    property variant ticket: null
    property int currentQuestionIndex: -1 
    property variant currentQuestion: {}
    
    onTicketChanged: {
        currentQuestionIndex = 0
    }
    
    onCurrentQuestionIndexChanged: {
        //console.log(JSON.stringify(ticket.questions));
        var nextQuestion = ticket.questions[currentQuestionIndex];
        console.log(JSON.stringify(nextQuestion));
        currentQuestion = nextQuestion;

    }
    
    onCurrentQuestionChanged: {
        questionLabel.text = currentQuestion.question;
        questionImageView.visible = currentQuestion.hasImage;
        choiceSelectionContainer.removeAll();
        var choiceSelection = choiceSelectionDefinition.createObject();
        choiceSelection.options = currentQuestion.answers;
        choiceSelectionContainer.add(choiceSelection);
     //   choiceSelection.options = currentQuestion.answers;
    }
    
    
    
    actions: [
        ActionItem {
            title: "Назад"
            imageSource: "asset:///icons/left.png"
            property bool canMove: currentQuestionIndex > 0
            ActionBar.placement: ActionBarPlacement.OnBar
            enabled: canMove
            onTriggered: {
                currentQuestionIndex--; 
            }
        },
        ActionItem {
            title: "Вперед"
            imageSource: "asset:///icons/right.png"
            property bool canMove: currentQuestionIndex < ticket.questions.length - 1
            enabled: canMove
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {
                currentQuestionIndex++;
            }
        },
        ActionItem {
            title: "Завершить"
            imageSource: "asset:///icons/done.png"
            ActionBar.placement: ActionBarPlacement.InOverflow
            onTriggered: {
                if (choiceSelection.selectedOptionIndex == currentQuestion.correctAnswerIndex) {
                    console.log("Правильно")
                } else {
                    console.log("Неправильно")
                }
            }
        }
    ]
    
    function leftpadded(number) {
        if (number < 10) {
            return "0" + number;
        }    
        return "" + number;
    }
    
    function imagePath(ticketIndex, questionIndex) {
        return "asset:///images/PDD/" + leftpadded(ticketIndex) + "-" + leftpadded(questionIndex) + ".jpg";
    }
    
    titleBar: TitleBar {
        title: "Билет " + ticket.ticketIndex + ", Вопрос " + (currentQuestionIndex + 1);
    }
    ScrollView {
        visible: !!ticket 
        implicitLayoutAnimationsEnabled: false
        Container {
            bottomPadding: 48.0

            ImageView {
                id: questionImageView
                imageSource: imagePath(ticket.ticketIndex, currentQuestionIndex + 1)
                scalingMethod: ScalingMethod.AspectFit
                horizontalAlignment: HorizontalAlignment.Fill
                preferredWidth: 1440
                visible: true //currentQuestion.hasImage
            }
            Container {
                leftPadding: 24.0
                rightPadding: 24.0
                topPadding: 24.0
                Label {
                    id: questionLabel
                    text: "question" // currentQuestion.question
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
                Divider {}
                Container {
                    id: choiceSelectionContainer
                    attachedObjects: [
                        ComponentDefinition {
                            id: choiceSelectionDefinition
                            ChoiceSelection {
                            }
                        }
                    ]
                    leftPadding: 16.0
                    rightPadding: 16.0
                }
            }
        }
    }

}
