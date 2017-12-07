import bb.cascades 1.4

/* Компонент для выбора вариантов */
Container {
    id: choiceSelection
    property variant options
    property variant selectedOptionIndex
    
    property variant choices
    
    onOptionsChanged: {
        choiceSelection.removeAll();
        choices = [];
        for (var i = 0; i < options.length; i++) {
            var option = options[i];
            var choice = choiceDefinition.createObject(choiceSelection);
            choice.text = option;
            choice.index = i;
            choices.push(choice);
            choiceSelection.add(choice);
        }
    }
    
    onSelectedOptionIndexChanged: {
        choices.forEach(function(choice, index) {
            choice.selected = (index == selectedOptionIndex) 
        })
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: choiceDefinition
            Choice {
                property int index
                onSelectedChanged: {
                    choiceSelection.selectedOptionIndex = index
                }
            }
        }
    ]
}
