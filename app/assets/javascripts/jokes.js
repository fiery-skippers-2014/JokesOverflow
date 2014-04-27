var Votes = {
  bindEvents: function() {
    $('.new_vote').on('ajax:success', this.success);
    $('.new_vote').on('ajax:error', this.showError);
    $('.sort_button').on('click' , this.changeSort);
  },
  success: function(e, data) {
    console.log("made it here")
    this.parentElement.querySelector('.votes').innerHTML = data

  },
  showError: function(e, data) {
    console.log(data)
    var old = this.parentElement.querySelector('.votes').innerText
    if(parseInt(old) >= 1){
      alert("You can only vote once")
    } else {
      alert("No negative votes")
    }
    this.parentElement.querySelector('.votes').innerHTML = old
  },

  changeSort: function(e, data){
    e.preventDefault()
    document.getElementById("ShowButton").value= "Hide Filter";

  }
}

$('document').ready(function() {
  Votes.bindEvents();
});
