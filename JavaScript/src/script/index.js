const searchBar = document.getElementById("search-input");
const resetBtn = document.getElementById("reset-btn");
const content = document.querySelectorAll(".info-card-content");

searchBar.addEventListener("change", (event) => {
  let inputValue = event.target.value.trim().split(/\s+/);
  console.log(inputValue);

  for (let index = 0; index < content.length; index++) {
    for (let valueIndex = 0; valueIndex < inputValue.length; valueIndex++) {
      if (
        content[index].children[0].innerHTML
          .toLowerCase()
          .search(inputValue[valueIndex].toLowerCase()) === -1
      ) {
        content[index].parentElement.classList.add("dp-none");
      } else {
        content[index].parentElement.classList.remove("dp-none");
      }
    }
  }
});

searchBar.addEventListener("keydown", (event) => {
  if (event.key === "Backspace") {
    for (let index = 0; index < content.length; index++) {
      content[index].parentElement.classList.remove("dp-none");
    }
  }
});

resetBtn.addEventListener("click", () => {
  searchBar.value = "";
  for (let index = 0; index < content.length; index++) {
    content[index].parentElement.classList.remove("dp-none");
  }
  searchBar.focus();
});
