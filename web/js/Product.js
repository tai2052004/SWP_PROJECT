/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


// Get the elements
const descriptionBtn = document.getElementById('descriptionBtn');
const reviewBtn = document.getElementById('reviewBtn');
const descriptionContent = document.getElementById('descriptionContent');
const reviewContent = document.getElementById('reviewContent');

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
        img: 'img/giay1.png',
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
    productTitle.textContent = products[index].title;
    productPrice.textContent = products[index].price;
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
const quantityInput = document.getElementById('quantity');
const increaseBtn = document.getElementById('increase');
const decreaseBtn = document.getElementById('decrease');

// Function to remove active class from size buttons and set clicked button as active
sizeButtons.forEach(button => {
    button.addEventListener('click', function() {
        sizeButtons.forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
    });
});

// Function to remove active class from color buttons and set clicked button as active
colorButtons.forEach(button => {
    button.addEventListener('click', function() {
        colorButtons.forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');
    });
});

// Quantity buttons functionality
increaseBtn.addEventListener('click', () => {
    let currentQuantity = parseInt(quantityInput.value);
    quantityInput.value = currentQuantity + 1;
});

decreaseBtn.addEventListener('click', () => {
    let currentQuantity = parseInt(quantityInput.value);
    if (currentQuantity > 1) {
        quantityInput.value = currentQuantity - 1;
    }
});
