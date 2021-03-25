const APIUtil = require('./api_util');

function FollowToggle(el){
  this.$el = $(el);
  this.userId = this.$el.data("user-id");
  this.followState = this.$el.data("initial-follow-state");
  this.render();
  this.$el.on("click", this.handleClick.bind(this));
}

FollowToggle.prototype.render = function() {
  
  switch (this.followState) {
    case "Following":
      this.$el.prop("disabled", true);
      this.$el.html("Following...");
      break;
    case "Unfollowing":
      this.$el.prop("disabled", true);
      this.$el.html("Unfollowing...");
      break;
    case "Followed":
      this.$el.prop("disabled", false);
      this.$el.html("Unfollow!");
      break;
    case "Unfollowed":
      this.$el.prop("disabled", false);
      this.$el.html("Follow!");
      break;
    default:
  };
}

FollowToggle.prototype.handleClick = function(event) {
  event.preventDefault();
  if (this.followState === "Unfollowed"){
    this.followState ="Following";
    this.render();
    APIUtil.followUser(this.userId).then(() => {
      this.followState ="Followed";
      this.render();
  });
  }  
  else if (this.followState === "Followed"){
    this.followState = "Unfollowing";
    this.render();
    APIUtil.unfollowUser(this.userId)
    .then(() => {
      this.followState = "Unfollowed";
      this.render();
  })    
  }

}

module.exports = FollowToggle;