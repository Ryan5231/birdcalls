$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("form").submit(function(e) {
    e.preventDefault();
    $("#spinner").fadeIn(300);
    $.ajax({
      data: {username: $("input:first-child").val()}, //sending to the server as an object
      type:"post",
      url: "/last_tweets"

    }).done(function(data) {
      $("#spinner").fadeOut(300);
      $(".container:first-child").empty().append(data);
    }).fail(function() {
      alert("no tweets to show");
      $("#spinner").fadeOut(300);
    });
  });

});
