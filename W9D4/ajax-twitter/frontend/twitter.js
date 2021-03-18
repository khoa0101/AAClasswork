const FollowToggle = require("./follow_toggle")

$(document).ready(function() {
  $( "button.follow-toggle" ).each(function(idx, el){
    const button = new FollowToggle(el);
  });
});
