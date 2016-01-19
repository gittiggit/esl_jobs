/*======================
Parallex scrolling background images
======================*/
   // cache the window object
   $window = $(window);
 
   $('section[data-type="background"], header[data-type="background"]').each(function(){
     // declare the variable to affect the defined data-type
     var $scroll = $(this);
                     
      $(window).scroll(function() {
        // HTML5 proves useful for helping with creating JS functions!
        // also, negative value because we're scrolling upwards                            
        var yPos = -($window.scrollTop() / $scroll.data('speed'));
         
        // background position
        var coords = '50% '+ yPos + 'px';
 
        // move the background
        $scroll.css({ backgroundPosition: coords });   
      }); // end window scroll
   });  // end section function

/*======================
img to background img
======================*/

$(window).scroll(function() {
  if ( $(window).width() <= 767) {
    $('#primaery-navbar').removeClass("sticky");
  }else {
    if ($(this).scrollTop() > 180){  
        $('#primaery-navbar').addClass("sticky");
      }
      else{
        $('#primaery-navbar').removeClass("sticky");
      }
  }
});

$(document).ready(function() {
  
$('.message-box').hide();
   $('.leav-reply-button').click(function() {
                $('.message-box').slideToggle("fast");
        });



// Configure/customize these variables.
    var showChar = 200;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Read more";
    var lesstext = "less";
    

    $('.more').each(function() {
        var content = $(this).html();
 
        if(content.length > showChar) {
 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
 
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
 
            $(this).html(html);
        }
 
    });
 
    $(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });




    $("div.bhoechie-tab-menu>div.list-group>a").click(function(e) {
        e.preventDefault();
        $(this).siblings('a.active').removeClass("active");
        $(this).addClass("active");
        var index = $(this).index();
        $("div.bhoechie-tab>div.bhoechie-tab-content").removeClass("active");
        $("div.bhoechie-tab>div.bhoechie-tab-content").eq(index).addClass("active");

         $("#video-con").fitVids();
    });

/*----------------------*/
/* New message onclick
/*----------------------*/
$('.newmsg').on('click',function(){
    if($('.main-messages-box-cover').css('display')!='none'){
    $('.new-message-cover').show().siblings('div').hide();
    }else if($('.user-msg').css('display')!='none'){
        $('.main-messages-box-cover').sh2ow().siblings('div').hide();
    }
});



    
    $("#searchdropdown li a").click(function(){
        $("#searchcategory").html($(this).text() + ' <span class="caret"></span>');
        $("#searchcategory").val($(this).text());
    });


});
function showcountry(country_val){
    if(country_val == 2){
        $("#country").removeAttr("disabled" );
    }
    if(country_val == 1){
        $("#country").attr( "disabled", "disabled" );
    }
}
/*----------------------*/
/* fiel upload with image preview
/*----------------------*/
 /*function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
                //$('#image_div').attr('display','block');
            }
            
            reader.readAsDataURL(input.files[0]);
            //$('#image_div').attr('display','block');
        }
    }    
    $("#imgInp").change(function(){
       //alert('sad');
        $("#image_div").css("display", "block");
        readURL(this);       
    });
function close_image(){
  $('#blah').attr('src', '');
  $("#image_div").css("display", "none");
}*/

$('#searchsubmit').click(function(){
var select_cat = $('#searchcategory').attr('value');
var name_param = $('#search_field').val();
var new_action;

if (select_cat == 'Jobs'){
  new_action = '/job_search_results?';
} else if ( select_cat == 'Teachers' ){
  new_action = '/school_search_results?';
} else if ( select_cat == 'Employers'){
  new_action = '/employee_search_results?';
}

$("#searchform").attr("action", new_action + name_param);
});