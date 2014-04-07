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

var counter = 0;
var logWords = [];
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
      logWords.push(event.results[i][0].transcript);
      if(logWords.contains("next")){
      readStep(steps[counter]);
      counter += 1;
      logWords = [];
      }
      logWords = [];
    }
  }
};



