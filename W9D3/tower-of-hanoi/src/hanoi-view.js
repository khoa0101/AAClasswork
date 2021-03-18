function View(game, dom){
  this.game = game;
  this.dom = dom;
  this.setupTowers();
  this.render();
}

View.prototype.render = function(){
  const ul = $("ul");
  const li = $("li");

  for (let i = 0; i < 3; i++)
  {
    for (let j = 0; j < 3; j++)
    {
      if (this.game.towers[i][j])
      {
        const rod = $(`.rod${i + 1}`);
        // .data("disNumber", this.game.towers[i][j]);
      }
      else 
      {
        $(`.rod${i+1} > disc${j}`).removeClass("hasDisc");
      }
    }
  }
}

View.prototype.setupTowers = function(){
  const rod1 = $("<ul>");
  const rod2 = $("<ul>");
  const rod3 = $("<ul>");
  rod1.addClass("rod1");
  rod1.data("index", 0);
  rod2.addClass("rod2");
  rod2.data("index", 1);
  rod3.addClass("rod3");
  rod3.data("index", 2);

  this.dom.append(rod1);
  this.dom.append(rod2);
  this.dom.append(rod3);

  for (let i = 0; i < 3; i++){
    let li = $("<li>");
    li.addClass(`spot-${i}`)

    li.data("index", i);
    rod1.append(li);
  }

  for (let i = 0; i < 3; i++){
    let li = $("<li>");

    li.data("index", i);
    rod2.append(li);
  }

  for (let i = 0; i < 3; i++){
    let li = $("<li>");

    li.data("index", i);
    rod3.append(li);
  }
}

module.exports = View;