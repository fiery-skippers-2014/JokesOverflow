var Votes = {
  bindEvents: function() {
    console.log('here')
    $('.new_vote').on('ajax:success', this.success);
    $('.new_vote').on('ajax:error', this.showError);
  },

  success: function(e, data) {
    debugger
    console.log(data)
  },

  showError: function(e, data) {
    console.log(data)

    $('.new_vote').append("You already voted Sucka!");
  },
}

$('document').ready(function() {
  Votes.bindEvents();
});