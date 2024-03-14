  var daysDisabled = "1,2,3,4,5,6";
  var dayOfLesson = "0";



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


