document.addEventListener('DOMContentLoaded', function() {
    const products = document.querySelectorAll('.product-card'); // Select all product cards
    const itemsPerPage = 12;  // Number of products to show per page
    let currentPage = 1;
    const totalPages = Math.ceil(products.length / itemsPerPage);  // Calculate total pages

    const paginationContainer = document.getElementById('pagination-buttons'); // Container for pagination buttons

    // Function to display products based on the current page
    function displayProducts(page) {
        const start = (page - 1) * itemsPerPage;
        const end = page * itemsPerPage;

        products.forEach((product, index) => {
            if (index >= start && index < end) {
                product.style.display = 'block'; // Show the product
            } else {
                product.style.display = 'none';  // Hide the product
            }
        });
    }

    // Function to update pagination buttons
    function updatePaginationButtons() {
        paginationContainer.innerHTML = ''; // Clear previous pagination buttons

        // Create previous button with icon
        const prevButton = document.createElement('button');
        prevButton.innerHTML = '<i class="fas fa-chevron-left"></i>';  // Left arrow icon
        prevButton.disabled = currentPage === 1; // Disable if on first page
        prevButton.addEventListener('click', function() {
            if (currentPage > 1) {
                currentPage--;
                displayProducts(currentPage);
                updatePaginationButtons();
            }
        });
        paginationContainer.appendChild(prevButton);

        // Create number buttons based on total pages
        for (let i = 1; i <= totalPages; i++) {
            const pageButton = document.createElement('button');
            pageButton.textContent = i;
            if (i === currentPage) {
                pageButton.classList.add('active'); // Add 'active' class to the current page button
            }
            pageButton.addEventListener('click', function() {
                currentPage = i;
                displayProducts(currentPage);
                updatePaginationButtons();
            });
            paginationContainer.appendChild(pageButton);
        }

        // Create next button with icon
        const nextButton = document.createElement('button');
        nextButton.innerHTML = '<i class="fas fa-chevron-right"></i>';  // Right arrow icon
        nextButton.disabled = currentPage === totalPages; // Disable if on last page
        nextButton.addEventListener('click', function() {
            if (currentPage < totalPages) {
                currentPage++;
                displayProducts(currentPage);
                updatePaginationButtons();
            }
        });
        paginationContainer.appendChild(nextButton);
    }

    // Initial display for page 1
    displayProducts(currentPage);
    updatePaginationButtons();
});
