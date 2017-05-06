$(document).on('click', '#btn-cmt', function() {
    var cmt = $('#cmt-field').val();
    var img_id = $('#img-id-field').val();
    $.ajax({
      type:'POST',
      url: '/image_comments',
      dataType: "json",
      data: {
        comment: cmt,
        image_id: img_id
      }
    });
    var l = '/images/' + img_id;
    $.ajax({
      type:'GET',
      url: l,
      dataType: "json",
    }).success(function(data){
      console.log(data)
        $('#cmt-section').load(document.URL + ' #cmt-section');
        $('#cmt-field').val('');
    })
});
  