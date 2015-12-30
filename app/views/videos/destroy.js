$('.video_list').hide();
$('#incomplete_videos').empty();
$('#incomplete_videos').append('<%= j render("index") %>');