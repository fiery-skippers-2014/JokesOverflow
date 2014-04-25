$(document).ready(function() {
  console.log("hi")
  $("a[data-remote]").on("ajax:success", this.appendJoke)
  $("new_joke").on("ajax:success", this.appendJoke)
  $("new_reply").on("ajax:success", this.appendReply)
  $("new_comment").on("ajax:success", this.appendComment)

  function appendJoke(data){
    debugger
    $('body').append(data)
  }

});
