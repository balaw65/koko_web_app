  $('.l1l4').click(function(){
      let instructions = document.getElementById("chordDiagramDescription");
      let firstRythm   = document.getElementById("firstRythmExercize");
      let button       = document.getElementById("nextl1l4");
 
      instructions.innerHTML  = "Work on the exercise below.  First start<br>";
      instructions.innerHTML += "by setting metronome to 50 beats per minute.<br>";
      instructions.innerHTML += "Count with the metronome, 1,2,3,4|1,2,3,4<br>";
      instructions.innerHTML += "When chord changes become smooth without missing<br>";
      instructions.innerHTML += "a beat, increase metronome by 5 and repeat.<br>";

      firstRythm.style.display = "inline";  //none, inline, block and inline-block
      button.style.display = "none";  //none, inline, block and inline-block
 
  }); 
 
