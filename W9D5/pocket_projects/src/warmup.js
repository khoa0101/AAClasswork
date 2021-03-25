
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const p = document.createElement("p");
  p.innerText = string;
  if (htmlElement.hasChildNodes()){
    while(htmlElement.firstChild){
      htmlElement.removeChild(htmlElement.firstChild);
    }
  }
  htmlElement.appendChild(p);

};

htmlGenerator('Party Time.', partyHeader);