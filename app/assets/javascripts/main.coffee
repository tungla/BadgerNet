# Toggles modal on page with id
toggleModal = (id) ->
    modal = document.getElementById(id)
    if !modal.style.display or modal.style.display == "none" 
        modal.style.display = "block"
    else modal.style.display = "none"