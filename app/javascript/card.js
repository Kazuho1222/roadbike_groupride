function card(){
  const card = document.querySelectorAll("div.col")

  card.forEach(function(card){
    card.addEventListener("mouseover", function(){
      this.setAttribute("style", "box-shadow: 0 10px 25px 0 rgba(0, 0, 0, 0.5);")
    })
  
    card.addEventListener("mouseout", function(){
      this.removeAttribute("style")
    })
  })
}

window.addEventListener("load", card)