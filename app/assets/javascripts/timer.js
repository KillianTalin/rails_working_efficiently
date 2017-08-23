// window.addEventListener("load", function(event) {
//   initializeClock('clockdiv', start);
// });

let start = new Date(0);
function getTime(starttime) {
  let t = starttime.setSeconds(starttime.getSeconds() + 1);
  // console.log(t);
  let seconds = Math.floor( (t/1000) % 60 );
  let minutes = Math.floor( (t/1000/60) % 60 );
  let hours = Math.floor( (t/(1000*60*60)) % 24 );
  let days = Math.floor( t/(1000*60*60*24) );
  return {
    'total': t,
    'hours': hours,
    'minutes': minutes,
    'seconds': seconds
  };
};

function initializeClock(id, starttime) {
  const clock = document.getElementById(id);
  const hoursSpan = clock.querySelector('.hours');
  const minutesSpan = clock.querySelector('.minutes');
  const secondsSpan = clock.querySelector('.seconds');
  const buttonHiddenInput = document.querySelector("#task_elapsed_time");
  function updateClock() {
    let t = getTime(starttime);
    console.log(t);
    buttonHiddenInput.value = t.total / 1000;
    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);
  }

  updateClock(); // run function once at first to avoid delay
  let timeinterval = setInterval(updateClock, 1000);

  const buttonPause = document.getElementById("button-pause");
  const buttonFinish = document.getElementById("button-finish");
  const buttonRestart = document.getElementById("button-restart");

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

  buttonFinish.addEventListener("click", (event) => {

    console.log(`localhost:3000/tasks/1/update?t=t`);
  });
}

