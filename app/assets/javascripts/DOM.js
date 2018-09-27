document.addEventListener('DOMContentLoaded', () => {
  const plus = document.querySelectorAll(".plus");
  const minus = document.querySelectorAll(".minus");
  
  plus.forEach( button => {
    button.addEventListener("click", function(event){
      const { currentTarget } = event;
      currentTarget.classList.toggle("hide")
      currentTarget.nextElementSibling.classList.toggle('hide');
      currentTarget.closest("li").querySelector(".description").classList.toggle("hide")
    })
  })

  minus.forEach( button => {
    button.addEventListener('click', function(event) {
      const { currentTarget } = event;
      currentTarget.classList.toggle("hide")
      currentTarget.previousElementSibling.classList.toggle('hide');
      currentTarget.closest("li").querySelector(".description").classList.toggle("hide")      
    })
  })
})