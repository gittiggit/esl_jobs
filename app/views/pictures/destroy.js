$('.picture_list').hide();
$('#incomplete_pictures').empty();
$('#incomplete_pictures').append('<%= j render("index") %>');