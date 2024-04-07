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


  function notesOnTrebleStaff(noteString)
  {
     const notes = noteString.split(",");
     let returnValue =  "<table class='test1'>";
         returnValue +=   "<tr class='test2'>";
         returnValue +=      "<td class='test3'>";
         returnValue +=              "&#x1d11e\n"; //treble clef
         returnValue +=      "</td>";
         returnValue +=      "<td class='test3' style='left:-23px'>";
         returnValue +=         "&#x1d11a&#x1d11a&#x1d103\n";                     // main staff
         returnValue +=      "</td>";
         returnValue +=      "<td class='test3' style='left:-23px'>";
         returnValue +=         "&#x1d11a\n";
         returnValue +=      "</td>";
         returnValue +=      "<td class='test3' style='left:-48px;top:34px;";
         returnValue += "color:"; //black";
         if (notes.length > 0)
         {
           const splitByColor = notes[0].split("-");
           if (splitByColor.length == 2)
           {
              returnValue += splitByColor[1];
           }
           else
           {
              returnValue += "black";
           }
         }
         else
           returnValue += "black";
 

         returnValue += "'>";
 
         returnValue +=         "&#x1d15f";                                       // quarter note
         returnValue +=      "</td>";
         returnValue +=      "<td class='test4' style='left:-70px;top:32px;'>";
         returnValue +=         "&#x1d118";                                       // under staff
         returnValue +=      "</td>";

         // A
         if (notes.length >= 2)
         {
           returnValue +=    "<td class='test3' style='left:-70px;top:0px'>";      // general staff
           returnValue +=       "&#x1d11a";
           returnValue +=    "</td>\n";
           returnValue +=    "<td class='test3' style='left:-98px;top:22px;";      // quarter note
           returnValue += "color:"
           const splitByColor = notes[1].split("-");
           if (splitByColor.length == 2)
           {
              returnValue += splitByColor[1];
           }
           else
           {
              returnValue += "black";
           }
           returnValue += "'>";
           returnValue +=       "&#x1d15f";
           returnValue +=    "</td>\n";
           returnValue +=    "<td class='test4' style='left:-120px;top:25px'>";       // under staff
           returnValue +=       "&#x1d117";
           returnValue +=    "</td>\n";
 
         }
         // D
         if (notes.length >= 3)
         {
           returnValue +=    "<td class='test3' style='left:-117px;top:0px'>";      // general staff
           returnValue +=       "&#x1d11a";
           returnValue +=    "</td>\n";
           returnValue +=    "<td class='test3' style='left:-145px;top:9px;color:";
           const splitByColor = notes[2].split("-");
           if (splitByColor.length == 2)
           {
              returnValue += splitByColor[1];
           }
           else
           {
              returnValue += "black";
           }
           returnValue += "'>";      // quarter note
           returnValue +=       "&#x1d15f";
           returnValue +=    "</td>\n";
         }
         // G
         if (notes.length >= 4)
         {
           returnValue +=    "<td class='test3' style='left:-130px;top:0px'>";      // general staff
           returnValue +=       "&#x1d11a";
           returnValue +=    "</td>\n";
           returnValue +=    "<td class='test3' style='left:-156px;top:-4px;color:";
           const splitByColor = notes[3].split("-");
           if (splitByColor.length == 2)
           {
              returnValue += splitByColor[1];
           }
           else
           {
              returnValue += "black";
           }
           returnValue += "'>";      // quarter note
           returnValue +=       "&#x1d15f";
           returnValue +=    "</td>\n";
         }
         // B
         if (notes.length >= 5)
         {
           returnValue +=    "<td class='test3' style='left:-143px;top:0px'>";      // general staff
           returnValue +=       "&#x1d11a";
           returnValue +=    "</td>\n";
           returnValue +=    "<td class='test3' style='left:-170px;top:-12px;color:";      // quarter note
           const splitByColor = notes[4].split("-");
           if (splitByColor.length == 2)
           {
              returnValue += splitByColor[1];
           }
           else
           {
              returnValue += "black";
           }
           returnValue += "'>";      // quarter note
 
           returnValue +=       "&#x1d15f";
           returnValue +=    "</td>\n";
         }
         // e
         if (notes.length >= 6)
         {
           returnValue +=    "<td class='test3' style='left:-156px;top:0px'>";      // general staff
           returnValue +=       "&#x1d11a";
           returnValue +=    "</td>\n";
           returnValue +=    "<td class='test3' style='left:-183px;top:-23px'>";      // quarter note
           returnValue +=       "&#x1d15f";
           returnValue +=    "</td>\n";
         }
 
 
         returnValue +=   "</tr>";
         returnValue += "</table>";
     return returnValue;
  }
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
            progress.innerHTML = "<a id='lesson2QuizLink' href='/l1_l1_questions/new'>Ready to review?</a>"
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
  function l1l2Graded(score)
  {
     let musicStaff = document.getElementById("musical_notes");
     let stringTable = document.getElementById("stringsmaintable");
 
     const scoreD = score.match(/[0-9]+.[0-9]+/g);

     console.log(scoreD);
     console.log(scoreD.length);

     if (scoreD.length == 1)
     {
        console.log(scoreD[0]);
        if (Number(scoreD[0]) > 98.0)
        {
           alert("Awesome, you scored 100%");
           musicStaff.removeAttribute("hidden");
           stringTable.setAttribute("class", "guitarnotes");
           musicStaff.innerHTML = notesOnTrebleStaff("ENO2-black,AN02-black,DN03-black,GN03-black,BN03-black,EN04-black");   // e natural, Octave 4
        }
     }
     else
       alert(score);

  }

  function testNewFunction() { 
    daysDisabled = "0";
    dayOfLesson = "1,2,3,4,5,6";
  }

  function testNewButtonFunction() { 
     console.log("NEW BUTTON PRESSED");
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

  $('.l1l2').click(function(){
     let stringTable = document.getElementById("guitarStringsTable");
   
     let classAttribute = stringTable.getAttribute("class");
     let button         = document.getElementById("btn");
     let l1l2r2c1       = document.getElementById("l1l2r2c1");
     let l1l2r3c1       = document.getElementById("l1l2r3c1");
     let EString        = document.getElementById("l1l2r3c1");
     let AString        = document.getElementById("l1l2r6c7");
     let DString        = document.getElementById("l1l2r6c8");
     let GString        = document.getElementById("l1l2r6c9");
     let BString        = document.getElementById("l1l2r6c10");
     let eString        = document.getElementById("l1l2r6c11");
     let nextLesson     = document.getElementById("nextLesson");

     switch (classAttribute)
     {
        case "guitarstrings":  // EString
           stringTable.setAttribute("class", "guitarstringseonly");
           AString.setAttribute("hidden", "true");
           DString.setAttribute("hidden", "true");
           GString.setAttribute("hidden", "true");
           BString.setAttribute("hidden", "true");
           eString.setAttribute("hidden", "true");
           button.innerHTML = "NEXT STRING";
           l1l2r2c1.innerHTML = "The thickest string is the E<br>";
           l1l2r2c1.innerHTML+= "string, typically the lowest<br>";
           l1l2r2c1.innerHTML+= "note of the guitar. Here is what<br>"
           l1l2r2c1.innerHTML+= "it looks like in music notation:<br><br>";
           l1l2r2c1.innerHTML+= notesOnTrebleStaff("ENO2-black");   // E natural, Octave 2
           break;
        case "guitarstringseonly":
           AString.removeAttribute("hidden");
           //EString.setAttribute("color", "#333333");
           stringTable.setAttribute("class", "guitarstringseandaonly");
           l1l2r2c1.innerHTML = "If you have not been exposed to sheet<br>";
           l1l2r2c1.innerHTML+= "music, not to worry.  We will cover it<br>";
           l1l2r2c1.innerHTML+= "at a self pace level in subsequent lessons<br>"
           l1l2r2c1.innerHTML+= "The next note is 'A' and it looks like this<br>in music notation:<br><br>";
           l1l2r2c1.innerHTML+= notesOnTrebleStaff("ENO2-grey,AN02-black");   // A natural, Octave 2
           break;
        case "guitarstringseandaonly":
           AString.removeAttribute("hidden");
           DString.removeAttribute("hidden");
 
           stringTable.setAttribute("class", "guitarstringseaanddonly");
           l1l2r2c1.innerHTML = "The next note is 'D':<br><br>";
           l1l2r2c1.innerHTML+= notesOnTrebleStaff("ENO2-grey,AN02-grey,DN03-black");   // D natural, Octave 2
           break;
         case "guitarstringseaanddonly":
           AString.removeAttribute("hidden");
           DString.removeAttribute("hidden");
           GString.removeAttribute("hidden");
 
           stringTable.setAttribute("class", "guitarstringseadandgonly");
           l1l2r2c1.innerHTML = "The next note is 'G':<br><br>";
           l1l2r2c1.innerHTML+= notesOnTrebleStaff("ENO2-grey,AN02-grey,DN03-grey,GN03-black");   // G natural, Octave 2
           break;
         case "guitarstringseadandgonly":
           AString.removeAttribute("hidden");
           DString.removeAttribute("hidden");
           GString.removeAttribute("hidden");
           BString.removeAttribute("hidden");
 
           stringTable.setAttribute("class", "guitarstringseadgandbonly");
           l1l2r2c1.innerHTML = "The next note is 'B':<br><br>";
           l1l2r2c1.innerHTML+= notesOnTrebleStaff("ENO2-grey,AN02-grey,DN03-grey,GN03-grey,BN03-black");   // B natural, Octave 3
           break;
         case "guitarstringseadgandbonly":
           AString.removeAttribute("hidden");
           DString.removeAttribute("hidden");
           GString.removeAttribute("hidden");
           BString.removeAttribute("hidden");
           eString.removeAttribute("hidden");
 
           stringTable.setAttribute("class", "guitarstringsall");
           l1l2r2c1.innerHTML = "The last note is also 'e',<br>";
           l1l2r2c1.innerHTML+= "it is two octaves above the low 'E'<br>";
           l1l2r2c1.innerHTML+= "string, I designated it as lowercase 'e'<br>";
           l1l2r2c1.innerHTML+= "in order to disguish it from low 'E'.<br><br>";
           l1l2r2c1.innerHTML+= notesOnTrebleStaff("ENO2-grey,AN02-grey,DN03-grey,GN03-grey,BN03-grey,EN04-black");   // e natural, Octave 4

           nextLesson.innerHTML = "<a class='lesson2QuizLink' href='/l1l2review'>Ready to review?</a>";

           break;
     }

  });

  $('.l1l3').click(function(){
     let cofTable = document.getElementById("circleOfFifthsTable");
     let classAttribute = cofTable.getAttribute("class");
     let description = document.getElementById("l1lr3instructions");
     let button = document.getElementById("nextl1l3");
   
     let keyofC      = document.getElementById("l1l3r2c8");
     let keyofG      = document.getElementById("l1l3r2c10");
     let keyofD      = document.getElementById("l1l3r4c12");
     let keyofA      = document.getElementById("l1l3r5c13");
     let keyofE      = document.getElementById("l1l3r7c12");
     let keyofB      = document.getElementById("l1l3r8c10");
     let keyofFSharp = document.getElementById("l1l3r9c7");
     let keyofCSharp = document.getElementById("l1l3r8c5");
     let keyofGSharp = document.getElementById("l1l3r7c1");
     let keyofEFlat  = document.getElementById("l1l3r5c2");
     let keyofBFlat  = document.getElementById("l1l3r4c2");
     let keyofF      = document.getElementById("l1l3r2c5");
     switch (classAttribute)
     {
        case "bluebackground":
           cofTable.setAttribute("class", "circleoffifths");
           description.innerHTML=  "No need to be to concerned about learning this right away,<br>";
           description.innerHTML+= "we will visit this a lot in upcoming lessons.";
           button.innerHTML= "NEXT";
 
           keyofC.innerHTML     = "C";
           keyofG.innerHTML     = "G";
           keyofD.innerHTML     = "D";
           keyofA.innerHTML     = "A";
           keyofE.innerHTML     = "E";
           keyofB.innerHTML     = "B";
           keyofFSharp.innerHTML= "F&#x266F";
           keyofCSharp.innerHTML= "C&#x266F";
           keyofGSharp.innerHTML= "A&#x266d/G&#x266f";
           keyofEFlat.innerHTML = "E&#x266d";
           keyofBFlat.innerHTML = "B&#x266d";
           keyofF.innerHTML     = "F";
 
           break;
        case "circleoffifths":
           cofTable.setAttribute("class", "keyofg");
           description.innerHTML=  "For this lesson, we will concentrate on 'C', 'G' and 'D',<br>";
           description.innerHTML+= "notice the numeral numbers 'IV', 'I', and 'V'";
 
           keyofC.innerHTML     = "C";
           keyofG.innerHTML     = "G";
           keyofD.innerHTML     = "D";
           keyofA.innerHTML     = "";
           keyofE.innerHTML     = "";
           keyofB.innerHTML     = "";
           keyofFSharp.innerHTML= "";
           keyofCSharp.innerHTML= "";
           keyofGSharp.innerHTML= "";
           keyofEFlat.innerHTML = "";
           keyofBFlat.innerHTML = "";
           keyofF.innerHTML     = "";
 
           break;
        case "keyofg":
           cofTable.setAttribute("class", "keyofgcontinued");
           description.innerHTML=  "Most artists pick the key of a song.  Mostly, the key remains the<br>";
           description.innerHTML+= "same through out the song.  Artists pick a key for a variety of reasons...";
 
           break;
        case "keyofgcontinued":
           cofTable.setAttribute("class", "keyofgcontinued2");
           description.innerHTML=  "Keys have a slight effect in changing the mood of the song.<br>";
           description.innerHTML+= "An artist may also pick the key based on their vocal range.";
 
           //keyofC.setAttribute("font-weight", "normal");
           //keyofD.setAttribute("font-weight", "normal");
 
           break;
         case "keyofgcontinued2":
           cofTable.setAttribute("class", "majorchordsofg");
           description.innerHTML=  "We are going to focus on the key of G Major...<br>";
 
           keyofC.style.fontWeight = "normal"; 
           keyofG.style.color = "red";
           keyofD.style.fontWeight = "normal"; 
           break;
         case "majorchordsofg":
           cofTable.setAttribute("class", "majorchordsofg");
           description.innerHTML=  "Each key has three major chords associated<br>";
           description.innerHTML+= "For the key of G, they are 'C', 'G', and 'D'";
           button.innerHTML = "<a href='/l1l3review' style='font-size:1.5em;font-weight:bold;' >Ready to review?</a>";
           button.style.backgroundColor = "transparent";
           break;
     }
 
  }); 

  $(document).ready(function(){
     const allAlerts = document.getElementsByClassName("alert-success");
     for (let i = 0; i < allAlerts.length; i++)
     {
        if (allAlerts[i].innerHTML.includes("You scored"))
        {
           l1l2Graded(allAlerts[i].innerHTML);
           break;
        }
     }
  });


//   $('.mydatepicker').datepicker({
//       //maxViewMode: 2,
//       orientation: "top right",
//       daysOfWeekDisabled: daysDisabled, //daysOfTheWeekDisabled,
//       daysOfWeekHighlighted: dayOfLesson, //dayOfTheWeekEnabled,
//       autoclose: true,
//       toggleActive: true
//       }
//   );


