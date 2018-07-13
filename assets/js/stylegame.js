// CLICK PROUT
$(".region*").click(function () {
    console.log('prout');
});


// NAVBAR RESPONSIVE
$('nav.side-open').click(function(){
    $('nav.side-open').toggleClass('open');
});

// MODALE DEVELOPPEMENT
var modaldev = $('.modal-dev');
$('.show-modal-dev').click(function() {
    modaldev.fadeIn();
});

$('.close-modal-dev').click(function() {
    modaldev.fadeOut();
});

// MODALE EXPANSION
var modalexp = $('.modal-exp');
$('.show-modal-exp').click(function() {
    modalexp.fadeIn();
});

$('.close-modal-exp').click(function() {
    modalexp.fadeOut();
});

// MODALE MAGOUILLE
var modalcheat = $('.modal-cheat');
$('.show-modal-cheat').click(function() {
    modalcheat.fadeIn();
});

$('.close-modal-cheat').click(function() {
    modalcheat.fadeOut();
});

// MODALE AMPOULE
var d = $('#somedialog');
$('.open').click(function(e){
    d.removeClass('dialog-close');
    d.addClass('dialog-open');
});
$('.close_info_bulles, .dialog-overlay').click(function(e){
    d.removeClass('dialog-open');
    d.addClass('dialog-close');
});