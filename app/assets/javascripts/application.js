//= require rails-ujs
//= require_tree .

/* this functions toggle the profile info and the form on the dashboard */
function displayForm() {
  document.getElementById('profile-info').classList.add("d-none");
  document.getElementById('profile-form').classList.remove("d-none");
}
function displayProfile() {
  document.getElementById('profile-info').classList.remove("d-none");
  document.getElementById('profile-form').classList.add("d-none");
}
