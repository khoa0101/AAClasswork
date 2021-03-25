/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"Clock\": () => (/* binding */ Clock)\n/* harmony export */ });\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\nclass Clock {\n  constructor() {\n    // 1. Create a Date object.\n    const currentTime = new Date();\n\n    // 2. Store the hour, minute, and second.\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n\n    // 3. Call printTime.\n    this.printTime();\n\n    // 4. Schedule the tick at 1 second intervals.\n    setInterval(this._tick.bind(this), 1000);\n  }\n\n  printTime() {\n    // Format the time in HH:MM:SS\n    const timeString = [this.hours < 10 ? \"0\" + this.hours : this.hours, \n      this.minutes < 10 ? \"0\" + this.minutes : this.minutes , \n      this.seconds < 10 ? \"0\" + this.seconds : this.seconds].join(\":\");\n    let clock = document.getElementById(\"clock\");\n    (0,_warmup__WEBPACK_IMPORTED_MODULE_0__.htmlGenerator)(timeString,clock);\n    // Use console.log to print it.\n  }\n\n  _tick() {\n    // 1. Increment the time by one second.\n    this._incrementSeconds();\n\n    // 2. Call printTime.\n    this.printTime();\n  }\n\n  _incrementSeconds() {\n    // 1. Increment the time by one second.\n    this.seconds += 1;\n    if (this.seconds === 60) {\n      this.seconds = 0;\n      this._incrementMinutes();\n    }\n  }\n\n  _incrementMinutes() {\n    this.minutes += 1;\n    if (this.minutes === 60) {\n      this.minutes = 0;\n      this._incrementHours();\n    }\n  }\n\n  _incrementHours() {\n    this.hours = (this.hours + 1) % 24;\n  }\n}\n\nconst clockElement = document.getElementById(\"clock\");\nlet clock = new Clock();\nclock.printTime();\n\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"attachDogLinks\": () => (/* binding */ attachDogLinks),\n/* harmony export */   \"handleEnter\": () => (/* binding */ handleEnter),\n/* harmony export */   \"handleLeave\": () => (/* binding */ handleLeave)\n/* harmony export */ });\n\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator(){\n  let dogArr = [];\n  for (const dog in dogs){\n    const a = document.createElement(\"a\");\n    a.innerHTML = dog;\n    a.href = dogs[dog];\n    const li = document.createElement(\"li\");\n    li.classList.add(\"dog-link\");\n    li.classList.add(\"hide\");\n    li.appendChild(a);\n    dogArr.push(li);\n  }\n  return dogArr;\n}\n\nfunction attachDogLinks(){\n  let dogLinks = dogLinkCreator();\n  let ul = document.querySelector(\".drop-down-dog-list\");\n  dogLinks.forEach((li)=>{\n    ul.appendChild(li);\n  })\n}\n\nfunction handleEnter(){\n  \n  document.querySelectorAll(\".dog-link\").forEach((li) =>{\n    li.classList.remove(\"hide\");\n  });\n  \n}\n\nfunction handleLeave(){\n  \n  document.querySelectorAll(\".dog-link\").forEach((li) => {\n    li.classList.add(\"hide\");\n  });\n}\n\nattachDogLinks();\n\nconst nav = document.querySelector(\".drop-down-dog-nav\");\n\nnav.addEventListener(\"mouseenter\",handleEnter);\nnav.addEventListener(\"mouseleave\", handleLeave);\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n\n\n\n\n\n// let clock = new Clock();\n\n// clock.printTime();\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"addTodo\": () => (/* binding */ addTodo),\n/* harmony export */   \"populateList\": () => (/* binding */ populateList),\n/* harmony export */   \"checkboxDone\": () => (/* binding */ checkboxDone)\n/* harmony export */ });\nconst todos = JSON.parse(localStorage.getItem(\"todo\")) || [];\n\nconst ul = document.querySelector(\".todos\");\nconst form = document.querySelector(\".add-todo-form\");\nconst checkbox = document.querySelectorAll(\"input[type='checkbox']\");\npopulateList();\n\nfunction addTodo(e){\n  e.preventDefault();\n  \n  const input = document.querySelector(\"input[name='add-todo']\");\n  const value = input.value;\n  const todo = { \n    value,\n    done: false \n  };\n  todos.push(todo);\n  input.value = \"\";\n  \n  localStorage.setItem(\"todo\",JSON.stringify(todos));\n  populateList();\n}\n\nfunction populateList(){\n\n  if (ul.children.length === 1)\n    todos.forEach ((el) => { \n      const label = document.createElement(\"label\");\n      const checkbox = document.createElement(\"input\");\n      checkbox.setAttribute(\"type\", \"checkbox\");\n\n      label.innerText = el.value;\n      checkbox.checked = el.done;\n\n      const li = document.createElement(\"li\");\n      li.appendChild(label);\n      li.appendChild(checkbox);\n      ul.appendChild(li);\n  })\n  else {\n    const newItem = todos[todos.length - 1];\n    const label = document.createElement(\"label\");\n    const checkbox = document.createElement(\"input\");\n    checkbox.setAttribute(\"type\", \"checkbox\");\n\n    label.innerText = newItem.value;\n    checkbox.checked = newItem.done;\n\n    const li = document.createElement(\"li\");\n    li.appendChild(label);\n    li.appendChild(checkbox);\n    ul.appendChild(li);\n  }\n}\n\nfunction checkboxDone(e){\n  if (e.target.checked) {}\n  // todos.forEach((el)=>{\n  //   if (el.done)\n  // })\n}\n\nform.addEventListener(\"submit\", addTodo);\ncheckbox.addEventListener(\"click\",)\n\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"htmlGenerator\": () => (/* binding */ htmlGenerator)\n/* harmony export */ });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  const p = document.createElement(\"p\");\n  p.innerText = string;\n  if (htmlElement.hasChildNodes()){\n    while(htmlElement.firstChild){\n      htmlElement.removeChild(htmlElement.firstChild);\n    }\n  }\n  htmlElement.appendChild(p);\n\n};\n\nhtmlGenerator('Party Time.', partyHeader);\n\n//# sourceURL=webpack:///./src/warmup.js?");

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
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;