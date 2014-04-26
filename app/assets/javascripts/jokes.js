var Votes = {
  bindEvents: function() {
    console.log('here')
    $('.new_vote').on('ajax:success', this.success);
    $('.new_vote').on('ajax:error', this.showError);
  },

  success: function(e, data) {
    this.parentElement.querySelector('.votes').innerHTML = data
  },

  showError: function(e, data) {
    console.log(data)
    this.parentElement.querySelector('.votes').innerHTML = "0 is as low as it goes :P"
  },
}

$('document').ready(function() {
  Votes.bindEvents();
});