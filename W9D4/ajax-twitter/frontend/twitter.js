const FollowToggle = require("./follow_toggle")

$(document).ready(function() {
  $( "button.follow-toggle" ).each(function(){
    const button = new FollowToggle();
    $(this).append(button);
  });
});
