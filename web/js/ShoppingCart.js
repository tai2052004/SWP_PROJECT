/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const quantityControls = document.querySelectorAll('.quantity-control');
const sizeChange = document.querySelectorAll('.size-selector');
sizeChange.forEach( newChange => {
    const sizeDropdown = newChange.querySelector('.size-nb530');
    sizeDropdown.addEventListener('change', function () {
        newChange.querySelector('.sizeChange').value = this.value; 
    });
});
quantityControls.forEach(control => {
    const decreaseBtn = control.querySelector('.decrease-btn');
    const increaseBtn = control.querySelector('.increase-btn');
    const quantityInput = control.querySelector('.quantity-data');

    // Xử lý nút giảm
    decreaseBtn.addEventListener('click', function () {
        let currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
            control.querySelector('.quantityChange').value = currentValue - 1;
        }
    });

    // Xử lý nút tăng
    increaseBtn.addEventListener('click', function () {
        let currentValue = parseInt(quantityInput.value);
        quantityInput.value = currentValue + 1;
        control.querySelector('.quantityChange').value = currentValue + 1;
    });

    // Xử lý khi người dùng nhập trực tiếp
    quantityInput.addEventListener('change', function () {
        let newValue = parseInt(this.value);

        if (isNaN(newValue) || newValue < 1) {
            Swal.fire({
                icon: 'error',
                title: 'Quantity invalid!',
                text: 'Please enter valid quantity and greater than 0',
                confirmButtonText: 'OK',
                confirmButtonColor: '#3085d6'
            }).then((result) => {
                // Reset về giá trị 1 sau khi hiển thị thông báo
                newValue = 1;
                this.value = 1;
                control.querySelector('.quantityChange').value = 1;
            });
        } else {
            this.value = newValue;
            control.querySelector('.quantityChange').value = newValue;
        }
    });
});


