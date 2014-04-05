readStep = function(words){
  var lineToRead = new SpeechSynthesisUtterance(words);
  speechSynthesis.speak(lineToRead);
};