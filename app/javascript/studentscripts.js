  var daysDisabled = "1,2,3,4,5,6";
  var dayOfLesson = "0";
  var fingerAt = 0;
  var intervalCount = 0;
  var symbolCount = 0;
  var firstIn = true;
  let iterate1;

  var musicSymbols = {};

  musicSymbols["treble clef"]  = "&#x1d120";
  musicSymbols["quarter note"] = "&#x1d15f";

  function iterateFingers()
  {
     console.log("FINGER");
     let l1l1s2Info         = document.getElementById("l1l1s2Info");
     let pinky              = document.getElementById("hr2c1");
     let ring_finger        = document.getElementById("hr1c2");
     let middle_finger      = document.getElementById("hr1c3");
     let index_finger       = document.getElementById("hr2c4");
     let thumb              = document.getElementById("hr3c5");
     let right_pinky        = document.getElementById("hr2c9");
     let right_ring_finger  = document.getElementById("hr1c8");
     let right_middle_finger= document.getElementById("hr1c7");
     let right_index_finger = document.getElementById("hr2c6");
     let right_thumb        = document.getElementById("hr3c6");
     let progress           = document.getElementById("l1l1s2InfoBlueTd");
     let handsButton        = document.getElementById("hands_button");
 
     switch (fingerAt)
     {
        case 0:
           l1l1s2Info.innerHTML = "For the left hand, the pinky is designated with the number 4";
           handsButton.innerHTML = "";
           if (firstIn)
           {
              progress.innerHTML           = "";
              firstIn = false;
           }
           ring_finger.innerHTML        = "";
           middle_finger.innerHTML      = "";
           index_finger.innerHTML       = "";
           thumb.innerHTML              = "";
           right_pinky.innerHTML        = "";
           right_ring_finger.innerHTML  = "";
           right_middle_finger.innerHTML= "";
           right_index_finger.innerHTML = "";
           right_thumb.innerHTML        = "";


           break;
        case 1:
           l1l1s2Info.innerHTML = "the ring finger is the number three";
           ring_finger.innerHTML = "3";
 
           break;
        case 2:
           l1l1s2Info.innerHTML = "middle finger is the number two";
           middle_finger.innerHTML = "2";
 
           break;
        case 3:
           l1l1s2Info.innerHTML = "index finger is number one, but what about the thumb?";
           index_finger.innerHTML = "1";
 
           break;
        case 4:
           l1l1s2Info.innerHTML = "In classical guitar, it was believed that the thumb was never going to be used.<br>" +
                                  "later on, we will use the thumb, so for now I am just going to give it the letter 't'";
           thumb.innerHTML = "t";
 
           break;
         case 5:
           l1l1s2Info.innerHTML = "'p', a strange letter to use for a thumb, but it actually comes from the spanish word<br>" +
                                  "pulgar.  For the right hand, the letters come from spanish";
           right_thumb.innerHTML = "p";
 
           break;
         case 6:
           l1l1s2Info.innerHTML = "'i', spanish for indice, or index";
           right_index_finger.innerHTML = "i";
 
           break;
         case 7:
           l1l1s2Info.innerHTML = "'m', spanish for medio, or middle";
           right_middle_finger.innerHTML = "m";
 
           break;
         case 8:
           l1l1s2Info.innerHTML = "'a', spanish for anular, or ring";
           right_ring_finger.innerHTML = "a";
 
           break;
         case 9:
           l1l1s2Info.innerHTML = "'c', spanish for chiquito, or little";
           right_pinky.innerHTML = "c";
 
           break;
         default:
            console.log("DONE, returning, but from where?");
            clearInterval(iterate1);
            progress.innerHTML = "<a id='reviewLink' href='/level1_lesson1/edit'>Ready to review?</a>"
            fingerAt = 0;
            fingerCount = 0;
            symbolCount = 0;
            intervalCount = 0;
            return;
     }
     progress.innerHTML = progress.innerHTML + musicSymbols["quarter note"]; // "&#x1d15f"; //musicSymbols["quarter note"]"; //&#x1d15f"
     symbolCount++;
     if (symbolCount > 15) symbolCount = 0;
 
     if (intervalCount > 10)
     {
        fingerAt++;
        intervalCount = 0;
        progress.innerHTML = "";
     }
     intervalCount++;
     
  }
  function enableDay(day)
  {
    console.log("Enable lesson day: " + day);
    switch (day)
    {
      case "Monday":
        daysDisabled = "0,2,3,4,5,6";
        dayOfLesson  = "1";
        break;
      case "Tuesday":
        daysDisabled = "0,1,3,4,5,6";
        dayOfLesson  = "2";
        break;
      case "Wednesday":
        daysDisabled = "0,1,2,4,5,6";
        dayOfLesson  = "3";
        break;
      case "Thursday":
        daysDisabled = "0,1,2,3,5,6";
        dayOfLesson  = "4";
        break;
      default:
        daysDisabled = "0,1,2,3,4,5,6";
        dayOfLesson  = "0";
 
    }
  }

  function testNewFunction() { 
    daysDisabled = "0";
    dayOfLesson = "1,2,3,4,5,6";
  }

  function testNewButtonFunction() { 
     console.log("NEW BUTTON PRESSED");
     alert("GOT HERE AT NEW BUTTON");
  }


  /* Simple button example: */
     $('.mybutton').click(function(){
            testNewButtonFunction();
      });


  $(document).ready(function(){
     // Okay this is working:
     $('.testfunction').ready(function(){
         var $lessonDay = $('#lessonday').html();
 
         if ($lessonDay)
         {
            enableDay($lessonDay);
         }
      });

  });

  $('.enablecalendar').click(function(){

     let calField = document.getElementById("startingdate");
     calField.disabled = false;

     $('.mydatepicker').datepicker({
         startDate: '+0d',
         orientation: "top right",
         daysOfWeekDisabled: daysDisabled, //daysOfTheWeekDisabled,
         daysOfWeekHighlighted: dayOfLesson, //dayOfTheWeekEnabled,
         autoclose: true,
         toggleActive: true
         }
     );
  });

  $('.l1l1').click(function(){
     let guitarTable = document.getElementById("guitar");
     let r1c1 = document.getElementById("r1c1");
     let l1l1Info = document.getElementById("l1l1Info");
     let gButton = document.getElementById("guitar_button");
     let l1l1s2Info = document.getElementById("l1l1s2Info");
 
     let classAttribute = guitarTable.getAttribute("class");

     //Use for http get:
     switch (classAttribute)
     {
        case "fullguitar":

           guitarTable.setAttribute("class", "soundboard");
           r1c1.innerHTML = "<p class='guitarParts'>Soundboard</p>";
           r2c3.innerHTML = "<p class='guitarParts'>Sound Hole</p>";
           l1l1Info.innerHTML = "For the acoustic guitar, the cavity, the wood, \
                                 and other factors is what gives a guitar the specific \
                                 and unique sound.";
           break;
        case "soundboard":
           guitarTable.setAttribute("class", "bridge");
           r1c2.innerHTML = "<p class='guitarParts'>Bridge</p>";
           l1l1Info.innerHTML = "The bridge is one of many parts that are needed to offer \
                                 support for the strings.";
 
          break;
        case "bridge":
           guitarTable.setAttribute("class", "saddle");
           r5c1.innerHTML = "<p class='guitarParts'>Saddle</p>";
           l1l1Info.innerHTML = "The saddle, supported by the bridge, supports and aligns the \
                                 six to twelve guitar strings.";
 
           break;
        case "saddle":
           guitarTable.setAttribute("class", "pickguard");
           r5c3.innerHTML = "<p class='guitarParts'>Pick Guard</p>";
           l1l1Info.innerHTML = "The pick guard is more for asthetics than anything, some and most \
                                 electric guitars have a variation or may not even have them at all.";
 
           break;
        case "pickguard":
           guitarTable.setAttribute("class", "fretboard");
           r4c4.innerHTML = "<p class='guitarParts'>Fret Board</p>";
           l1l1Info.innerHTML = "Sometimes also referred to the 'neck' of the guitar may vastly \
                                 vary in length to offer various ranges of the guitar itself.";
 
           break;
        case "fretboard": //CHange to nut:
           guitarTable.setAttribute("class", "nut");
           r4c5.innerHTML = "<p class='guitarParts'>Nut</p>";
           l1l1Info.innerHTML = "The nut is another support piece for the strings, locate on the other side ot the fret board";
           break;
        case "nut": //CHange to nut:
           guitarTable.setAttribute("class", "tuningpegs");
           r2c5.innerHTML = "<p class='guitarParts'>Tuning Pegs</p>";
           l1l1Info.innerHTML = "The tuning pegs become very important when it come to tuning the guitar.  Please become very familar with these, you will use them alot!!";
           break;
        case "tuningpegs": //CHange to frets
           guitarTable.setAttribute("class", "frets");
           r3c4.innerHTML = "<p class='guitarParts'>Frets</p>";
           l1l1Info.innerHTML = "Frets will be discussed in much detail from here on forward.  The understanding of them will become second nature to you in no time!";
           gButton.innerHTML = "<a id='handLink' href='#myhand'>Click here to learn about finger designations</a>"
 
           break;
        default:
           l1l1s2Info.innerHTML = "Wait and see what these strange letters designated mean...";
           //setInterval(iterateFingers, 50); //1000);
           iterate1 = setInterval(iterateFingers, 50); //1000);
           console.log("GOT HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
//   GET, but does not work this way
//         fetch("l1l1_hand",{method:"GET"});
//         const xhr = new XMLHttpRequest();
//         xhr.open("GET", "l1l1hand")
//         xhr.send();
//         xhr.responseType = "json";
//         xhr.onload = () => {
//           console.log("GOT HERE!!!!!!");
//         }
     }
  });



//$(document).ready(function(){
//   $('.mydatepicker').datepicker({
//       //maxViewMode: 2,
//       orientation: "top right",
//       daysOfWeekDisabled: daysDisabled, //daysOfTheWeekDisabled,
//       daysOfWeekHighlighted: dayOfLesson, //dayOfTheWeekEnabled,
//       autoclose: true,
//       toggleActive: true
//       }
//   );
//});


