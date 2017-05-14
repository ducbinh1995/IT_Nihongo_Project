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
    }).success(function(data){
       var l = '/images/' + img_id;
      $('#cmt-section').load(l + ' #cmt-section ');
      $('#cmt-field').val('');
    });

});

function deletecmt(variable) {
  var l = '/image_comments/' + variable;
  $.ajax({
    type:'DELETE',
    url: l,
    dataType: "json",
  }).success(function(data){
    console.log(data)
    $('#cmt-section').load(document.URL + ' #cmt-section > *');
    $('#cmt-field').val('');
  });
};

