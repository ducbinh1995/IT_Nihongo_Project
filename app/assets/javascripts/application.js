// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require toastr
//= require_tree .

var options = {
    closeButton: true,
    progressBar: true,
    tapToDismiss: true,
    showDuration: 150,
    hideDuration: 800,
    extendedTimeOut: 800,
    timeOut: 3000,
    positionClass : "toast-top-right-c"
}


function initPage() {
    toastr.options = options;
    var notice = $('#notice');
    if (notice.text() != "") {
        toastr.success(notice.text());
        notice.hide();
    }
  
}

document.addEventListener("turbolinks:load", function() {
    initPage();
})

