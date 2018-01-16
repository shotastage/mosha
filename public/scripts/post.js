var emo = document.getElementById("emo");

var anger = data[0].scores.anger;
var contempt = data[0].scores.contempt;
var disgust = data[0].scores.disgust;
var fear = data[0].scores.fear;
var happiness = data[0].scores.happiness;
var neutral = data[0].scores.neutral;
var sadness = data[0].scores.sadness;
var surprise = data[0].scores.surprise;


var emos = [
    data[0].scores.anger,
    data[0].scores.contempt,
    data[0].scores.disgust,
    data[0].scores.fear,
    data[0].scores.happiness,
    data[0].scores.neutral,
    data[0].scores.sadness,
    data[0].scores.surprise
];

var emotion = "";


var max = Math.max.apply(null, emos);


for (var i = 0; i <= emos.length; i++) {
    if ( emos[i] == max) {
        if (i == 0) {
            emotion = "Angry";
        }
        if (i == 1) {
            emotion = "contempt";
        }
        if (i == 2) {
            emotion = "disgust";
        }
        if (i == 3) {
            emotion = "Fear";
        }
        if (i == 4) {
            emotion = "Happy";
        }
        if (i == 5) {
            emotion = "neutral";
        }
        if (i == 6) {
            emotion = "sad";
        }
        if (i == 7) {
            emotion = "surprise";
        }
    }
}

emo.innerText = emotion;
