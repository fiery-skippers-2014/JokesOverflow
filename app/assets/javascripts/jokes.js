var submitReplyForm = {
  bindFormListener: function(){
    console.log("in bindFormListener")
    var $new_reply = $("#new_reply")
    $new_reply.on('ajax:success', this.success)
    $new_reply.on('ajax:error', this.error)
  },

  success: function(e, data){
    console.log("in  success")
    $('ul').prepend(data)
  },

  error: function(e, data){
    console.log(data)
    console.log("form Error :(")
  }
}

var renderReplyForm = {
  bindEvents: function(){
    $(".create_reply").on('ajax:success', this.success);
    $(".create_reply").on('ajax:error', this.showError);
  },

  success: function(e, data){
    console.log("in success")
    $('a.create_reply').fadeOut()
    $('.all_replies').hide().prepend(data).fadeIn()
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
