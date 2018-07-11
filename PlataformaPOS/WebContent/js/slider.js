$(document).ready(function () {
    $('li.menu_sub').click(function () {
	$('div.submenu').slideToggle('medium');
	$('a#inicio').css({ background: "#25a824" });
    });
});


$(document).ready(function () {
    $('li.no_menu_sub').mouseover(function () {
	$('a#inicio').css({ background: "transparent" });
    });
});

$(document).ready(function () {
    $('div.submenu').mouseout(function () {
	$('div.submenu').slideToggle('medium');
    });
});