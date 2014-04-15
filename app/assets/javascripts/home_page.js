
$(function(){
  /**************** Scroll efect ****************/

  $(document).on("click", ".scroll", function(e){     
    e.preventDefault();
    var destination = $(this).attr("href")
    $('html,body').animate({scrollTop:$(destination).offset().top}, 500);
  });

  /**************** Galery Modal ****************/
  
  var getDataAndAppendToModal = function(url, modal){
    $.get(url, function(serverResponse){ 
      $(modal).html(serverResponse);
      $(modal).append("<a class='close-reveal-modal '>&#215;</a>");
    });
  }

  $(document).on("click", "#galery-link", function(event){
    event.preventDefault();
    var url = $(this).attr("href")
    getDataAndAppendToModal(url, "#first-modal");    
  })

  /**************** Second Modal ****************/

  $(document).on("click", ".album-link", function(event){
    event.preventDefault();
    var url = $(this).attr("href");
    getDataAndAppendToModal(url,"#second-modal");
  })
  
  $(document).on('opened','#second-modal', function(){
    $(window).trigger('resize')
  });

  /**************** Request Quote modal ****************/
  $(document).on("click", ".request-quote-link", function(event){
    event.preventDefault();
    var url = $(this).attr("href")
    getDataAndAppendToModal(url,"#small-modal");
  });

  
  $(document).on("submit",".new_quote_request", function(event){
    event.preventDefault();
    var data  = $(this).serialize();
    var url = $(this).attr("action")
    $.post(url, data, function(serverResponse){
      console.log(serverResponse);
      $("#small-modal").html(serverResponse);
      $("#small-modal").append("<a class='close-reveal-modal '>&#215;</a>");
    })
  })

})
