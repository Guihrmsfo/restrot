// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require app
//= require js/chart.min.js
//= require js/chart-data.js
//= require js/easypiechart.js
//= require js/easypiechart-data.js
//= require js/bootstrap-datepicker.js

jQuery(function($) {
// when the #region_id field changes
  $("#contact_country_id").live('change', function() {
    // make a POST call and replace the content
    var country = $('select#contact_country_id :selected').val();
    if(country == "") country="0";
    jQuery.get('/countries/update_city_select/' + country, function(data){
        $("#cities").html(data);
    })
    return false;
  });
});

jQuery(function($) {
    $("#sortTable").tablesorter({
        headers : {
            5: {
                sorter: false
            },
            8: {
                sorter: false
            },
            9: {
                sorter: false
            }
        },
        sortList: [[0,0]] 
    });
});

 jQuery(function($) {
  $('.action-icon').twipsy();
  $("a[rel=twipsy]").twipsy({
    live: true
  });
 });
//= require_tree .
