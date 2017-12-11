import bb.cascades 1.4

/* Компонент для выбора вариантов */
Container {
    id: choiceSelection
    property variant options
    property int selectedOptionIndex
    property variant choices: []
    
    onOptionsChanged: {
     //   console.log("Options changed: ", JSON.stringify(options));
        choiceSelection.removeAll();
        
    //    choices = new Array();
        var localChoices = [];
        for (var i = 0; i < options.length; i++) {
            var option = options[i];
            var choice = choiceDefinition.createObject();
            choice.text = option;
            choice.index = i;
          //  console.log(choice);
            choiceSelection.add(choice);
            
            localChoices.push(choice);
          //  console.log(localChoices.length);

        }
        choices = localChoices;
        selectedOptionIndex = -1
    }
    
    onSelectedOptionIndexChanged: {
    //    console.log("Selected index changed: ", selectedOptionIndex);
      //  console.log(JSON.stringify(choiceSelection.controls));
        choices.forEach(function(choice, index) {
        //    console.log(choice.index, index, choice.text, index == selectedOptionIndex);
            choice.selected = (index == selectedOptionIndex) 
        })
    }
    
    attachedObjects: [
        ComponentDefinition {
            id: choiceDefinition
            Choice {
                property int index
                
                onSelectedChanged: {
                    if (selected) {
                        selectedOptionIndex = index    
                    }
                }
                topMargin: 12.0
                bottomMargin: 12.0
            }
        }
    ]
}
