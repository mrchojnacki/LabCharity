function updateSummary() {

    let categoryValue = " ";
    let checkboxes = document.getElementsByName('category');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            categoryValue = checkboxes[i].id;
        }
    }
    let selectedInstitution = document.getElementById("institution");
 /*   let institutionCheckBoxes = document.getElementByName('institution');
    for (var i = 0; i < institutionCheckBoxes.length; i++) {
        if (institutionCheckBoxes[i].checked) {
            selectedInstitution = institutionCheckBoxes[i].id;
        }
    }*/

    let institutionOption = selectedInstitution.options[selectedInstitution.selectedIndex].firstChild.data;



    document.getElementById('summary-quantity-category').textContent = document.getElementById('quantity').value + " " + categoryValue;
    document.getElementById('summary-institution').textContent = 'Dla fundacji: ' + institutionOption + " w " + document.getElementById('city').value;
    document.getElementById('summary-street').textContent = document.getElementById('street').value;
    document.getElementById('summary-city').textContent = document.getElementById('city').value;
    document.getElementById('summary-zipCode').textContent = document.getElementById('zipCode').value;
    document.getElementById('summary-phone').textContent = document.getElementById('phone').value;
    document.getElementById('summary-pickUpDate').textContent = document.getElementById('pickUpDate').value;
    document.getElementById('summary-pickUpTime').textContent = document.getElementById('pickUpTime').value;
    document.getElementById('summary-pickUpComment').textContent = document.getElementById('pickUpComment').value;
}
