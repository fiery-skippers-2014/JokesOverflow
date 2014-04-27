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
});


//   function appendJoke(data){
//     $('body').append(data)
//   }

// });
