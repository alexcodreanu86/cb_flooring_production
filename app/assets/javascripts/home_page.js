
$(function(){
  $(document).on("click", ".scroll", function(e){     
    e.preventDefault();
    var destination = $(this).attr("href")
    $('html,body').animate({scrollTop:$(destination).offset().top}, 500);
  });
})