
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(){
  let dogArr = [];
  for (const dog in dogs){
    const a = document.createElement("a");
    a.innerHTML = dog;
    a.href = dogs[dog];
    const li = document.createElement("li");
    li.classList.add("dog-link");
    li.classList.add("hide");
    li.appendChild(a);
    dogArr.push(li);
  }
  return dogArr;
}

export function attachDogLinks(){
  let dogLinks = dogLinkCreator();
  let ul = document.querySelector(".drop-down-dog-list");
  dogLinks.forEach((li)=>{
    ul.appendChild(li);
  })
}

export function handleEnter(){
  
  document.querySelectorAll(".dog-link").forEach((li) =>{
    li.classList.remove("hide");
  });
  
}

export function handleLeave(){
  
  document.querySelectorAll(".dog-link").forEach((li) => {
    li.classList.add("hide");
  });
}

attachDogLinks();

const nav = document.querySelector(".drop-down-dog-nav");

nav.addEventListener("mouseenter",handleEnter);
nav.addEventListener("mouseleave", handleLeave);