
$(function(){
  /**************** Scroll efect ****************/

  $(document).on("click", ".scroll", function(e){     
    e.preventDefault();
    var destination = $(this).attr("href")
    $('html,body').animate({scrollTop:$(destination).offset().top}, 500);
  });

  /**************** Galery Modal ****************/

  $(document).on("click", "#galery-link", function(event){
    event.preventDefault();
    var url = $(this).attr("href")
    console.log(url)
    $.get(url, function(serverResponse){
      $("#modal-popup").html(serverResponse);
      $("#modal-popup").append("<a class='close-reveal-modal '>&#215;</a>");
    });
  })

  
})
