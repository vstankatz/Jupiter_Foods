import $ from 'jquery'
$(document).ready(function() {
  if (current_user.nil?) {
    $(".private").show();
  }
})
