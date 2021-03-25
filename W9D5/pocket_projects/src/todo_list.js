const todos = JSON.parse(localStorage.getItem("todo")) || [];

const ul = document.querySelector(".todos");
const form = document.querySelector(".add-todo-form");
const checkbox = document.querySelectorAll("input[type='checkbox']");
populateList();

export function addTodo(e){
  e.preventDefault();
  
  const input = document.querySelector("input[name='add-todo']");
  const value = input.value;
  const todo = { 
    value,
    done: false 
  };
  todos.push(todo);
  input.value = "";
  
  localStorage.setItem("todo",JSON.stringify(todos));
  populateList();
}

export function populateList(){

  if (ul.children.length === 1)
    todos.forEach ((el) => { 
      const label = document.createElement("label");
      const checkbox = document.createElement("input");
      checkbox.setAttribute("type", "checkbox");

      label.innerText = el.value;
      checkbox.checked = el.done;

      const li = document.createElement("li");
      li.appendChild(label);
      li.appendChild(checkbox);
      ul.appendChild(li);
  })
  else {
    const newItem = todos[todos.length - 1];
    const label = document.createElement("label");
    const checkbox = document.createElement("input");
    checkbox.setAttribute("type", "checkbox");

    label.innerText = newItem.value;
    checkbox.checked = newItem.done;

    const li = document.createElement("li");
    li.appendChild(label);
    li.appendChild(checkbox);
    ul.appendChild(li);
  }
}

export function checkboxDone(e){
  if (e.target.checked) {}
  // todos.forEach((el)=>{
  //   if (el.done)
  // })
}

form.addEventListener("submit", addTodo);
checkbox.addEventListener("click",)

