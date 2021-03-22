/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/***/ ((module) => {

eval("class DomNodeCollection {\n  constructor(nodes) {\n    this.nodes = nodes;\n  }\n\n  each(cb) {\n    this.nodes.forEach(cb);\n  }\n\n  on(eventName, callback) {\n    this.each((node) => {\n      node.addEventListener(eventName, callback);\n      const eventKey = `jqliteEvents-${eventName}`;\n      if (typeof node[eventKey] === \"undefined\") {\n        node[eventKey] = [];\n      }\n      node[eventKey].push(callback);\n    });\n  }\n\n  off(eventName) {\n    this.each((node) => {\n      const eventKey = `jqliteEvents-${eventName}`;\n      if (node[eventKey]) {\n        node[eventKey].forEach((callback) => {\n          node.removeEventListener(eventName, callback);\n        });\n      }\n      node[eventKey] = [];\n    });\n  }\n\n  html(html) {\n    if (typeof html === \"string\") {\n      this.each((node) => {\n        node.innerHTML = html;\n      });\n    } else if (this.nodes.length > 0) {\n      return this.nodes[0].innerHTML;\n    }\n  }\n\n  empty() {\n    this.html('');\n  }\n\n  append(children) {\n    if (this.nodes.length === 0) return;\n\n    if (typeof children === 'object' &&\n        !(children instanceof DomNodeCollection)) {\n      children = $l(children);\n    }\n\n    if (typeof children === \"string\") {\n      this.each((node) => {\n        node.innerHTML += children;\n      });\n    } else if (children instanceof DomNodeCollection) {\n      this.each((node) => {\n        children.each((childNode) => {\n          node.appendChild(childNode.cloneNode(true));\n        });\n      });\n    }\n  }\n\n  remove() {\n    this.each(node => node.parentNode.removeChild(node));\n  }\n\n  attr(key, val) {\n    if (typeof val === \"string\") {\n      this.each(node => node.setAttribute(key, val));\n    } else {\n      return this.nodes[0].getAttribute(key);\n    }\n  }\n\n  addClass(newClass) {\n    this.each(node => node.classList.add(newClass));\n  }\n\n  removeClass(oldClass) {\n    this.each(node => node.classList.remove(oldClass));\n  }\n\n  toggleClass(toggleClass) {\n    this.each(node => node.classList.toggle(toggleClass));\n  }\n\n  find(selector) {\n    let foundNodes = [];\n    this.each((node) => {\n      const nodeList = node.querySelectorAll(selector);\n      foundNodes = foundNodes.concat(Array.from(nodeList));\n    });\n    return new DomNodeCollection(foundNodes);\n  }\n\n  children() {\n    let childNodes = [];\n    this.each((node) => {\n      const childNodeList = node.children;\n      childNodes = childNodes.concat(Array.from(childNodeList));\n    });\n    return new DomNodeCollection(childNodes);\n  }\n\n  parent() {\n    const parentNodes = [];\n    this.each(({ parentNode }) => {\n      if (!parentNode.visited) {\n        parentNodes.push(parentNode);\n        parentNode.visited = true;\n      }\n    });\n\n    parentNodes.forEach((node) => {\n      node.visited = false;\n    });\n    return new DomNodeCollection(parentNodes);\n  }\n}\n\nmodule.exports = DomNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const DomNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\")\n\n\n//# sourceURL=webpack:///./src/index.js?");

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
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;