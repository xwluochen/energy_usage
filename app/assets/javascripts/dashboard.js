$(document).ready(function() {
  $('#year').change(function(event) {
    event.preventDefault();
    var year = $(this).val();

    $.get(window.location.href + "/dashboard/usage_filter", { year: year },
          function(data) {
            $("table tbody").html(data);
          }, "html");
  });
});