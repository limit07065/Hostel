/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// js for navbar slide down profile
$('.dropdown-menu').addClass('invisible'); //FIRST TIME INVISIBLE

// ADD SLIDEDOWN ANIMATION TO DROPDOWN-MENU
$('.dropdown').on('show.bs.dropdown', function (e) {
    $('.dropdown-menu').removeClass('invisible');
    $(this).find('.dropdown-menu').first().stop(true, true).slideDown(200);
});

// ADD SLIDEUP ANIMATION TO DROPDOWN-MENU
$('.dropdown').on('hide.bs.dropdown', function (e) {
    $(this).find('.dropdown-menu').first().stop(true, true).slideUp(200);
});
// END js for navbar slide down profile
// 
//js for display choosen image for profile upload




function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            var url = "url('" + e.target.result + "')";
            $('#imgUpload').css("background-image", url);
            //$('#imgUpload').('src', );
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#upload").change(function () {
    readURL(this);
});

//END js for display choosen image for profile upload

//js for slide img to selected room type

function slidetoroom()
{
    input =$("#roomtype").find(":selected").data("slide-to");
    
    $("ol li:eq("+input+")").click();
   
}
    