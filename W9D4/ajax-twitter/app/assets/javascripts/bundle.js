/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/api_util.js":
/*!******************************!*\
  !*** ./frontend/api_util.js ***!
  \******************************/
/***/ ((module) => {

const APIUtil = {
  followUser: id => {
    // ...
    return $.ajax({
      method: "POST",
      url: `/users/${id}/follow`,
      dataType: "json"
    })
  },

  unfollowUser: id => {
    // ...
  return $.ajax({
    method: "DELETE",
    url: `/users/${id}/follow`,
    dataType: "json"
  }) 
  }
};

module.exports = APIUtil;

/***/ }),

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

const APIUtil = __webpack_require__(/*! ./api_util */ "./frontend/api_util.js");

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

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js")

$(document).ready(function() {
  $( "button.follow-toggle" ).each(function(idx, el){
    const button = new FollowToggle(el);
  });
});

})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map