const products = [
    {
        name: "Nike Full Force Low",
        image: "img/shoes_4.png",
        price: "2,190,000"
    },
    {
        name: "Reebok Club C Revenge",
        image: "img/shoes_1.png",
        price: "2,350,000"
    },
    {
        name: "Nike Air Max 270",
        image: "img/shoes_5.png",
        price: "1,930,000"
    },
    {
        name: "New Balance 530",
        image: "img/shoes_2.png",
        price: "2,050,000"
    }
];
document.addEventListener("DOMContentLoaded", () => {
    let currentIndex = 0;

    const productImage = document.getElementById("product-image");
    const productName = document.getElementById("product-name");
    const productPrice = document.getElementById("product-price");

    const prevSlide = document.getElementById("prev-slide");
    const nextSlide = document.getElementById("next-slide");

    function updateProduct(index) {
        productImage.src = products[index].image;
        productName.textContent = products[index].name;
        productPrice.textContent = products[index].price;
    }

    // Chuyển sang sản phẩm trước
    prevSlide.addEventListener("click", () => {
        currentIndex = (currentIndex === 0) ? products.length - 1 : currentIndex - 1;
        updateProduct(currentIndex);
    });

    nextSlide.addEventListener("click", () => {
        currentIndex = (currentIndex === products.length - 1) ? 0 : currentIndex + 1;
        updateProduct(currentIndex);
    });
});
