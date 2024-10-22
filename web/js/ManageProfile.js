/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

document.querySelectorAll('.part1-second-detail2 a').forEach(item => {
    item.addEventListener('click', function(event) {
        // Xóa class 'active' ở tất cả các phần tử
        document.querySelectorAll('.profile-name').forEach(div => div.classList.remove('active'));
        document.querySelectorAll('.profile-img').forEach(img => img.classList.remove('active'));

        // Thêm class 'active' cho phần tử hiện tại
        const targetId = this.querySelector('.profile-name').id;
        document.getElementById(targetId).classList.add('active'); // thêm active cho profile-name
        document.getElementById(`${targetId}-icon`).classList.add('active'); // thêm active cho profile-img (icon)
    });
});

    

