var Votes = {
  bindEvents: function(){
    console.log("in bindEvents")
    $(".new_vote").on('ajax:success', this.success);
    $(".new_vote").on('ajax:error', this.showError);
  },
  success: function(e, data){
    console.log("success")
    this.parentElement.querySelector('.votes').innerHTML = data
  },
  showError: function(e, data) {
    this.parentElement.querySelector('.votes').innerHTML = "0 is as low as it goes :P"
  }
}


$('document').ready(function() {
  console.log("doc is ready")
  Votes.bindEvents()
});


//   function appendJoke(data){
//     $('body').append(data)
//   }

// });
