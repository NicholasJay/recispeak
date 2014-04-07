
// adding the ability to remove a step from a recipe if you no longer want to have it (for editing a recipe)
removeSteps = function(link){
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up("#steps").hide();
};

// ability to remove an ingredient for a recipe if you no longer want that ingredient (for editing a recipe)
removeIngredients = function(link){
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up("#ingredients").hide();
};

// this will allow additional fields to be added to a form, so my recipes can have as many ingredients or steps as
// the user would like. 
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).before(content.replace(regexp, new_id));
}

// this will read aloud the step from the recipe array
readStep = function(words){
  var lineToRead = new SpeechSynthesisUtterance(words);
  speechSynthesis.speak(lineToRead);
};

// create a new speech recognition object
var recognizer = new webkitSpeechRecognition();
recognizer.continuous = true;

// A secret console log to show that the recognition has correctly been executed
recognizer.onstart = function(){
  console.log("recognition has started");
};

// Set the counter to 0 to iterate through the steps. Each if statement handles a different
// voice command. Next, Beginning, and Back, will all navigate through the array of steps
// so the user can easily communicate what they need.

counter = 0;
recognizer.onresult = function(event) {
  for (var i = event.resultIndex; i < event.results.length; i++) {
    if ((event.results[i].isFinal) && (event.results[i][0].transcript == 'next')){
      readStep(steps[counter]);
      counter += 1;
    } else if ((event.results[i].isFinal) && (event.results[i][0].transcript == 'beginning')){
      counter = 0;
      readStep(steps[counter]);
      counter += 1;
    } else if ((event.results[i].isFinal) && (event.results[i][0].transcript == 'back')){
      if(j !== 0){
        counter -= 1;
        readStep(steps[counter]);
        counter += 1;
      } else {
        counter = 0;
        readStep(steps[counter]);
        counter += 1;
      }
    } else {
      console.log(event.results);
      readStep(steps[counter]);
      counter += 1;
    }
  }
};



