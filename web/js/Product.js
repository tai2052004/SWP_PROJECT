/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// Get the elements
const descriptionBtn = document.getElementById('descriptionBtn');
const reviewBtn = document.getElementById('reviewBtn');
const descriptionContent = document.getElementById('descriptionContent');
const reviewContent = document.getElementById('reviewContent');
const quantityInput = document.getElementById('quantity');
window.onload = function() {
    updateSize();
    updateQuantity();
//    document.getElementById("displayQuantity").innerHTML = "Quantity : " + quantityInput.value;
};
function updateQuantity() {
    document.querySelectorAll(".selectedQuantity").forEach(input => input.value = quantityInput.value);
}
function updateSize() {
    var activeSizeButton = document.querySelector(".size-button.active");
    if (activeSizeButton) {
        var activeSizeText = activeSizeButton.innerText;
        // Chỉ cập nhật khi tìm thấy input có class .selectedSize
        const selectedSizes = document.querySelectorAll(".selectedSize");
        if (selectedSizes.length > 0) {
            selectedSizes.forEach(input => input.value = activeSizeText);
        }
    }
}

function updateImage() {
    // Lấy ảnh đang được chọn (ảnh có class "active-thumbnail")
    var activeThumbnail = document.querySelector(".additional-image.active-thumbnail").getAttribute("src");
    if (activeThumbnail) {
        document.querySelectorAll(".selectedImage").forEach(input => input.value = activeThumbnail);
    }
}

function updateColor() {
    // Lấy màu đang được chọn (nút có class "active")
    var activeColorButton = document.querySelector(".color-button.active").style.backgroundColor;
    if (activeColorButton) {
        // Lấy giá trị màu từ thuộc tính background-color của nút
        document.querySelectorAll(".selectedColor").forEach(input => input.value = activeColorButton);
    }
}



function updateTitle()
{
    var productTitle = document.getElementById("productTitle").innerText;
    if (productTitle) {
        document.querySelectorAll(".productTitleHidden").forEach(input => input.value = productTitle);
    }
}
function updatePrice()
{
    var productPrice = document.getElementById("productPrice").innerText;
    if (productPrice) {
        document.querySelectorAll(".productPriceHidden").forEach(input => input.value = productPrice);
    }
}
//window.onload = function () {
//            var size = document.querySelector('.selectedSize').value;
//            var quantity = document.querySelector('.selectedQuantity').value;
//            document.getElementById("sizeDisplay").innerHTML = "Selected Size: " + size +"quantity : " + quantity;  // In ra nội dung
//        };
// Add event listeners

descriptionBtn.addEventListener('click', function() {
    // Show description content and hide review content
    descriptionContent.classList.add('active');
    reviewContent.classList.remove('active');
    
    // Change button colors
    descriptionBtn.classList.add('active');
    reviewBtn.classList.remove('active');
});

reviewBtn.addEventListener('click', function() {
    // Show review content and hide description content
    reviewContent.classList.add('active');
    descriptionContent.classList.remove('active');
    
    // Change button colors
    reviewBtn.classList.add('active');
    descriptionBtn.classList.remove('active');
});

// Star rating functionality
const stars = document.querySelectorAll('.star');
let currentRating = 0; // To store the selected rating

// Highlight stars on hover
stars.forEach(star => {
    star.addEventListener('mouseover', function() {
        const rating = this.getAttribute('data-value'); // Get star value
        highlightStars(rating); // Highlight stars up to the hovered one
    });

    // When mouse leaves, reset if no rating is clicked yet
    star.addEventListener('mouseout', function() {
        if (currentRating === 0) {
            resetStars();
        } else {
            highlightStars(currentRating); // Keep the selected rating highlighted
        }
    });

    // On click, set the rating
    star.addEventListener('click', function() {
        currentRating = this.getAttribute('data-value'); // Store the clicked rating
        highlightStars(currentRating); // Keep the stars highlighted after click
    });
});

// Function to reset all stars to default (gray)
function resetStars() {
    stars.forEach(star => {
        star.classList.remove('active');
    });
}

// Function to highlight stars up to a certain rating
function highlightStars(rating) {
    resetStars(); // Clear all highlights first
    for (let i = 0; i < rating; i++) {
        stars[i].classList.add('active'); // Highlight all stars up to the given rating
    }
}

// Product data: an array of objects with image, title, and price
const products = [
    {
        img: 'img/shoes_2.png',
        title: 'Nike Full Force Low - Black / Fire Red',
        price: '2.190.000'
    },
    
    {
        img: 'img/giay3.png',
        title: 'Nike Jordan Mid - Black / Green',
        price: '4.200.000'
    },
    {
        img: 'img/giay4.png',
        title: 'Nike SB Dunk Low - Blue / Red',
        price: '3.990.000'
    }
];

// Current product index
let currentIndex = 0;

// DOM elements
const productImg = document.getElementById('productImg');
const productTitle = document.getElementById('productTitle');
const productPrice = document.getElementById('productPrice');
const additionalImages = document.querySelectorAll('.additional-image');



// Function to update the product details
function updateProductDetails(index) {
    productImg.src = products[index].img;
    updateImage();
}

// Function to remove active state from thumbnails
function clearActiveThumbnails() {
    additionalImages.forEach(img => img.classList.remove('active-thumbnail'));
}

// Add event listeners to additional images to highlight the active image
additionalImages.forEach((image, index) => {
    image.addEventListener('click', () => {
        // Clear any existing active thumbnails
        clearActiveThumbnails();
        // Set the clicked image as active
        image.classList.add('active-thumbnail');
        // Update the main image and other product details
        updateProductDetails(index);
        
    });
});

// Event listeners for arrow clicks
document.querySelector('.arrow-left').addEventListener('click', () => {
    currentIndex = (currentIndex === 0) ? products.length - 1 : currentIndex - 1;
    updateProductDetails(currentIndex);
    clearActiveThumbnails();
    additionalImages[currentIndex].classList.add('active-thumbnail');
});

document.querySelector('.arrow-right').addEventListener('click', () => {
    currentIndex = (currentIndex === products.length - 1) ? 0 : currentIndex + 1;
    updateProductDetails(currentIndex);
    clearActiveThumbnails();
    additionalImages[currentIndex].classList.add('active-thumbnail');
});

// Select all size and color buttons
const sizeButtons = document.querySelectorAll('.size-button');
const colorButtons = document.querySelectorAll('.color-button');

const increaseBtn = document.getElementById('increase');
const decreaseBtn = document.getElementById('decrease');

// Function to remove active class from size buttons and set clicked button as active
sizeButtons.forEach(button => {
    button.addEventListener('click', function() {
        sizeButtons.forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
        updateSize();
    });
});

// Function to remove active class from color buttons and set clicked button as active
colorButtons.forEach(button => {
    button.addEventListener('click', function() {
        colorButtons.forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
        updateColor();
    });
});

// Quantity buttons functionality
increaseBtn.addEventListener('click', () => {
    let currentQuantity = parseInt(quantityInput.value);
    quantityInput.value = currentQuantity + 1;
    updateQuantity();
});

decreaseBtn.addEventListener('click', () => {
    let currentQuantity = parseInt(quantityInput.value);
    if (currentQuantity > 1) {
        quantityInput.value = currentQuantity - 1;
    }
    updateQuantity();
});

// Lấy thông tin title và price từ trang sản phẩm
var title = document.getElementById("productTitle").innerText;
var price = document.getElementById("productPrice").innerText;

// Gán giá trị ban đầu cho title và price vào thẻ input hidden
document.getElementById("productTitleHidden").value = title;
document.getElementById("productPriceHidden").value = price;
var selectedQuantityInput = document.getElementById("selectedQuantity");


