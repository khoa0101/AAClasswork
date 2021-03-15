// using the arguments keyword
// function sum()
// {
//   let sum = 0;

//   for (let i = 0; i < arguments.length; i++)
//   {
//     sum += arguments[i];
//   }
// //   return sum;
// // }
// //using ... operator
// function sum(...args)
// {
//   let sum = 0;

//   for (let i = 0; i < args.length; i++)
//   {
//     sum += args[i];
//   }
//   return sum;
// }
// // console.log(sum(1, 2, 3, 4) === 10);
// // console.log(sum(1, 2, 3, 4, 5) === 15);

// //version 1
// // Function.prototype.myBind = function()
// // {
// //   let that = this;
// //   let args = Array.prototype.slice.call(arguments);

// //   return function()
// //   {
// //     let args1 = Array.prototype.slice.call(arguments);
// //     let args2 = args.slice(1).concat(args1);
// //     that.apply(args[0], args2);
// //   }
// // }

// //version 2
// Function.prototype.myBind = function(...args)
// {
//   let that = this;
//   return function(...array) {
//     let args2 = args.slice(1).concat(array);
//     that.apply(args[0], args2)
//   }
// }

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true


function curriedSum(n) {
  let numbers = [];

  return _curriedSum = function(num) {
    numbers.push(num);
    if (numbers.length === n) {
      let sum = 0;
      for (let i = 0; i < n; i++) {
        sum += numbers[i];
      }
      return sum 
    } else {
      return _curriedSum
    }
  }
}

// let sum = curriedSum(4);
// sum(5)(30)(20)(1);
// console.log(sum);

Function.prototype.curry = function(numArgs, context) {
  let that = this;
  let args1 = [];

  return _curriedFunction = function(...args) {
    args1 = args1.concat(args);
    console.log(args1);
    if (args1.length === numArgs) {
      return that.apply(context, args1);
    }
    else {
      return _curriedFunction;
    }
  }
}

function sumThree(num1, num2, num3)
{
  return num1 + num2 + num3;
}

let f1 = sumThree.curry(3);
f1 = f1(4); // [Function]
f1 = f1(20); // [Function]
f1 = f1(6); // = 30
console.log(f1);