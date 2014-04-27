var submitReplyForm = {
  bindFormListener: function(){
    var $new_reply = $("#new_reply")
    $new_reply.on('ajax:success', this.showSuccess)
    $new_reply.on('ajax:error', this.showError)
  },

  showSuccess: function(e, data){
    console.log(data)
    console.log("formsuccess")
  },

  showError: function(e, data){
    console.log(data)
    console.log("form Error :(")
  }

}

var renderReplyForm = {
  bindEvents: function(){
    $(".button").on('ajax:success', this.success);
    $(".button").on('ajax:error', this.showError);
  },

  success: function(e, data){
    //awesome way to append ajax, .replyform should be hidden by default
    $('.replyform').hide().append(data).slideDown()
    // $('.replyform').append(data).slideDown()
    submitReplyForm.bindFormListener()

  },

  showError: function(e, data) {
    console.log("failure in Reply")
  }
}


var Votes = {
  bindEvents: function(){
    $(".new_vote").on('ajax:success', this.success);
    $(".new_vote").on('ajax:error', this.showError);
  },
  success: function(e, data){
    this.parentElement.querySelector('.votes').innerHTML = data
  },
  showError: function(e, data) {
    this.parentElement.querySelector('.votes').innerHTML = "0 is as low as it goes :P"
  }
}


$('document').ready(function() {
  Votes.bindEvents()
  renderReplyForm.bindEvents()
});

