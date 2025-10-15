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

function submitFeedback(event) {
    const err = [];
    const input = document.querySelectorAll("form input");
    const text_area = document.querySelector("form textarea");
    let paragraph_element_text;
    event.preventDefault();
    let alertContainer = document.getElementsByClassName("alert-container");
    const alertElement = document.querySelectorAll(".alert-container div");

    if (!text_area.value) err.push(text_area.id);

    input.forEach((element) => {
        if (!element.value && element.attributes.type.value !== "submit") {
            err.push(element.attributes.type.value);
        } else if (
            element.attributes.type.value == "email" &&
            element.value !== ""
        ) {
            if (
                /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(
                    element.value
                ) == false
            ) {
                err.push("error_email_format");
            }
        }
    });

    alertElement.forEach((element) => {
        element.remove();
    });

    if (err.length > 0) {
        err.forEach((err_field) => {
            const div = document.createElement("div");
            const span = document.createElement("span");
            const p = document.createElement("p");
            div.className = "alert";
            div.id = err_field;
            if (err_field == "text") {
                paragraph_element_text = document.createTextNode(
                    `Nama Tidak boleh kosong, Error! Harap check kembali`
                );
            } else if (err_field == "email") {
                paragraph_element_text = document.createTextNode(
                    `Email Tidak boleh kosong, Error! Harap check kembali`
                );
            } else if (err_field == "feedback") {
                paragraph_element_text = document.createTextNode(
                    `Masukan Dan Saran Tidak boleh kosong, Error! Harap check kembali`
                );
            } else if (err_field == "error_email_format") {
                paragraph_element_text = document.createTextNode(
                    `Format email tidak valid. Silakan periksa kembali`
                );
            }
            span.className = "closebtn";
            span.innerHTML = "&times;";
            span.setAttribute("onclick", "close_button(this)");

            p.appendChild(paragraph_element_text);

            div.appendChild(span);
            div.appendChild(p);
            alertContainer[0].appendChild(div);
        });
        console.log(err);
    } else {
        alert("Terima kasih atas masukan dan saran Anda.");
    }

    err.length = 0; // reset error
}
function close_button(element) {
    element.parentElement.remove();
}
