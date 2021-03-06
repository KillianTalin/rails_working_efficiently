playButtons = [].slice.call(document.getElementsByClassName("js-start"));
playButtons.forEach(
  function(element, index){
    element.addEventListener("click", function(event){
      var taskId = event.target.id.substring(12, event.target.id.length);
      var clockDivId = "clockdiv-" + taskId;
      console.log(clockDivId);

      $("#start-start-" + taskId).hide();
      $("#toggle-timer-" + taskId).show();
      $("#button-pause-" + taskId).removeClass("hidden");
      $("#button-finish-" + taskId).removeClass("hidden");

      const currentElapsedTime = document.getElementById("current_elapsed_time-" +  taskId);

      if (currentElapsedTime.value === "") {
        var start = new Date(0);
      } else {
        var start = new Date(parseInt(currentElapsedTime.value) * 1000);
      }

      initializeClock(clockDivId, taskId, start);
    });
  }
);

function getTime(starttime) {
  let t = starttime.setSeconds(starttime.getSeconds() + 1);
  const seconds = Math.floor( (t/1000) % 60 );
  const minutes = Math.floor( (t/1000/60) % 60 );
  const hours = Math.floor( (t/(1000*60*60)) % 24 );
  const days = Math.floor( t/(1000*60*60*24) );
  return {
    'total': t,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
};

function initializeClock(id, taskId, starttime) {
  const clock = document.getElementById(id);
  // const hoursSpan = clock.querySelector('.hours');
  const minutesSpan = clock.querySelector('.minutes');
  console.log(clock);
  const secondsSpan = clock.querySelector('.seconds');
  const buttonHiddenInput = document.querySelector("#elapsed_time_" + taskId);
  const pauseButtonHiddenInput = document.querySelector("#elapsed_time_pause_" + taskId);

  function updateClock() {
    let t = getTime(starttime);
    console.log(t.total/1000)
    buttonHiddenInput.value = t.total / 1000;
    pauseButtonHiddenInput.value = t.total / 1000;
    // hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);
  }

  updateClock(); // run function once at first to avoid delay
  let timeinterval = setInterval(updateClock, 1000);

  const buttonPause = document.getElementById("button-pause-" + taskId);
  const buttonFinish = document.getElementById("button-finish-" + taskId);
  const buttonRestart = document.getElementById("button-restart-" + taskId);

  buttonPause.addEventListener("click", (event) => {
    clearInterval(timeinterval);
    buttonPause.classList.add("hidden");
    buttonRestart.classList.remove("hidden");
  });

  buttonRestart.addEventListener("click", (event) => {
    timeinterval = setInterval(updateClock, 1000);
    buttonRestart.classList.add("hidden");
    buttonPause.classList.remove("hidden");
  });
}
