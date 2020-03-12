//= require rails-ujs
//= require_tree .
//= require rails-social-share-button

/* this functions toggle the profile info and the form on the dashboard */
function displayForm() {
  document.getElementById('profile-info').classList.add("d-none");
  document.getElementById('profile-form').classList.remove("d-none");
};

function displayProfile() {
  document.getElementById('profile-info').classList.remove("d-none");
  document.getElementById('profile-form').classList.add("d-none");
};


/* These functions toggle the group edit form in group show */

function displayGroups() {
  document.getElementById('group-form').classList.add("d-none");
  document.getElementById('group-form').classList.remove("d-none");
}

function displayFormForGroups() {
  document.getElementById('group-info').classList.remove("d-none");
  document.getElementById('group-form').classList.add("d-none");
};

function startTimer(duration, display) {
    var start = Date.now(),
        diff,
        minutes,
        seconds;
    function timer() {
        // get the number of seconds that have elapsed since
        // startTimer() was called
        diff = duration - (((Date.now() - start) / 1000) | 0);

        // does the same job as parseInt truncates the float
        minutes = (diff / 60) | 0;
        seconds = (diff % 60) | 0;

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (diff <= 0) {
            // add one second so that the count down starts at the full duration
            // example 05:00 not 04:59
            start = Date.now() + 1000;
        }
    };
    // we don't want to wait a full second before the timer starts
    timer();
    setInterval(timer, 1000);
}

window.onload = function () {
    var fiveMinutes = 60 * 38,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};
