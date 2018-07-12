// CLICK PROUT
$(".region*").click(function () {
    console.log('prout');
});


// NAVBAR RESPONSIVE
$('nav.side-open').click(function(){
    $('nav.side-open').toggleClass('open');
});


// MODAAAAAAAAAAAAAAAAAAAAAAAAAAALE 1 WOOOOP WOOOOP ELLE FONCTIOOOOONNNEEEEEEEE
$('.button-dev').click(function(){
    var buttonId = $(this).attr('id');
    $('#modal-container-dev').removeAttr('class').addClass(buttonId);
    $('body').addClass('modal-active');
})

$('#modal-container-dev').click(function(){
    $(this).addClass('out');
    $('body').removeClass('modal-active');
});

// MODALE 2
$('.button-exp').click(function(){
    var buttonId = $(this).attr('id');
    $('#modal-container-exp').removeAttr('class').addClass(buttonId);
    $('body').addClass('modal-active');
})

$('#modal-container-exp').click(function(){
    $(this).addClass('out');
    $('body').removeClass('modal-active');
});

// MODALE 3
$('.button-cheat').click(function(){
    var buttonId = $(this).attr('id');
    $('#modal-container-cheat').removeAttr('class').addClass(buttonId);
    $('body').addClass('modal-active');
})

$('#modal-container-cheat').click(function(){
    $(this).addClass('out');
    $('body').removeClass('modal-active');
});