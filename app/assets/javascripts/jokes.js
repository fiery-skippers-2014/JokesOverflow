var Replies = {
  bindEvents: function(){
    $(".button").on('ajax:success', this.success);
    $(".button").on('ajax:error', this.showError);
  },

  success: function(e, data){
    console.log("success in Reply")
    console.log(data)
    $('.replyform').append(data)
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
  Replies.bindEvents()
});


//   function appendJoke(data){
//     $('body').append(data)
//   }

// });
