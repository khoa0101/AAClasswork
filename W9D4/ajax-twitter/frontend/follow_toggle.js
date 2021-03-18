function FollowToggle(el){
  this.$el = $(el);
  this.userId = this.$el.data("user-id");
  this.followState = this.$el.data("initial-follow-state");
  this.render();
  this.$el.on("click", this.handleClick.bind(this));
}

FollowToggle.prototype.render = function() {
  
  if (this.followState === "Unfollowed") {
    this.$el.text("Follow!");
  } else {
    this.$el.text("Unfollow!");
  };
}

FollowToggle.prototype.handleClick = function(event) {
  event.preventDefault();
  let methodName = this.followState === "Unfollowed" ? "POST" : "DELETE"; 
  return $.ajax({
    method: methodName,
    url: `/users/${this.userId}/follow`,
    dataType: "json"
  }).then(() => {
      this.followState = this.followState === "Unfollowed" ? "Followed" : "Unfollowed";
      this.render();
    })
  
}

module.exports = FollowToggle;