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
  document.getElementById('group-info').classList.add("d-none");
  document.getElementById('group-form').classList.remove("d-none");
};

function displayFormForGroups() {
  document.getElementById('group-info').classList.remove("d-none");
  document.getElementById('group-form').classList.add("d-none");
};


