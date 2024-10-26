<%-- 
    Document   : AddInventory
    Created on : Oct 26, 2024, 4:41:42 PM
    Author     : fakesimp6996
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
        <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Kavoon&display=swap" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
        <link href="CSS/styles2.css" rel="stylesheet" />
        <style> 
       body{
        color:black;
       }
    .inventory-item {
        display:grid;
        margin-left: 200px;
        margin-right: 200px;
        margin-bottom: 45px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }
    .inventory-item img {
        /* width: 100%; */
        border-radius: 10px;
    }
    .inventory-item input, .inventory-item select, .inventory-item textarea {
        width: 100%;
        padding: 10px;
    
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
    }
    .inventory-item button {
        padding: 10px 20px;
        background-color: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }
    .inventory-item .size-options {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
    }
    .size-options input[type="radio"] {
        margin-right: 10px;
    }
    .size-options label {
        display: flex;
        align-items: center;
        margin-top: 5px;
    }</style>
    </head>
    <body>
         <div class="header">
            <div>
                <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
                <img src="assets/logo2.png" width="110" height="27" />
                <img src="assets/back-arrow.svg" width="24" height="30" style="margin-left: 27px" />
                <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
                <span class="title accent-text" style="margin-left: 40px">
                    Inventory Manage
                    </span>
            </div>
            <div>
                <div class="logout-button">
                    <span class="title black-text">Logout</span>
                    <img src="assets/logout.svg" width="30" height="30" />
                </div>
            </div>
        </div>
        <div class="body">
            <div class="sidebar">
                <div class="sidebar-top">
                    <img src="assets/sidebar-logo.svg" width="76" height="71" />
                    <span>Warehouse.</span>
                </div>
                <div class="sidebar-bottom">
                    <div x-data="{ isOpen: false}" style="width: 100%">
                        <div @click="isOpen= !isOpen" class="sidebar-button">
                            <img src="assets/dashboard.svg" width="36" height="36" style="margin-right: 13px" />
                            <span style="margin-right: auto"> Dashboard </span>
                            <img src="assets/arrow-down.svg" width="24" height="24" style="
                                        margin-right: 13px;
                                        transition: ease 0.2s;
                                    " :class="isOpen && 'is-arrow-down'" />
                        </div>
    
                        <div class="collapsible" :class="isOpen && 'is-open'" :style="isOpen && {height: '100%'}">
                            <a class="sidebar-button is-active" href="WarehouseInventory.jsp">
                                <img src="assets/Vector.svg" width="36" height="36" style="margin-right: 13px" /> Inventory Manage
                            </a>
                            <a class="sidebar-button" href="Prepare_Good.jsp">
                                <img src="assets/PrepareGood.svg" width="36" height="36" style="margin-right: 13px" /> Prepare Good
                            </a>                          
                        </div>
                    </div>
                </div>
            </div>
        
            <div class="content">
                <div style="display: flex;justify-content: space-between; flex-direction: row;">
                    <div>
                    <h1>New Inventory Item</h1>
                    </div>
                    <div style="margin-top: 20px;">
                        <a  style="
                            padding: 13px;
                              border-radius: 25px;
                                 border: 1px solid #75777a;
                                 background: #75777a;
                             align-items: center;
                             gap: 8px;
                             cursor: pointer;
                             text-decoration: none;
                             color: black;
                    " href="WarehouseInventory.jsp">
                    <img src="assets/return.svg" alt="sort" width="20" height="20">
                        Return
                    </a>
                    </div>
                </div>
                <!-- Inventory Form -->
                <div class="inventory-item">
                    <!-- Left Column (Image and Inputs) -->
                    <div style="display: flex;"  >
                        <img src="assets/image.png"  width="300" height="300" alt="Product Image">
                        <input style="width: 36%;
                        margin-bottom: auto;
                        margin-top: auto;
                        margin-left: 53px;" type="file" accept="image/*">
                    </div>
        
                    <!-- Right Column (Form Inputs) -->
                    <div style="display: flex; gap: 400px;">
                        <div>
                        <p style="background: bisque;  width: fit-content;">Product Name<p>
                        <input   type="text" placeholder="Enter name">
        
                        <p>Select Brand</p>
                        <select style="    width: 109%;">
                            <option value="">Select Brand</option>
                            <option value="1">Brand 1</option>
                            <option value="2">Brand 2</option>
                        </select>
        
                        <p style="margin-top: 40px;">Selling Price</p>
                        <input type="number" placeholder="Enter price">
        
                        
                        <div style="margin-top: 30px; display: flex; justify-content: space-around;">
                            <span style="background: bisque; height: fit-content; margin: auto;">Size</span>
                            
                            <select id="sizeSelect" style="width: 30%;">
                                <option value="39">39</option>
                                <option value="40">40</option>
                                <option value="41">41</option>
                            </select>
                            
                            <button id="addButton" style="
                                border-radius: 4px;
                                background: #1d81f3;
                                color: white;
                                border: none;
                                margin-left: 15px;
                            ">
                                + Add
                            </button>
                        </div>
                        
                        <table id="sizeTable" style="width: 50%; margin-top: 20px; border-collapse: collapse;">
                            <thead>
                                <tr>
                                    <th style="border-right: 1px solid black; padding: 10px;">Size</th>
                                    <th style="padding: 10px;">Quantity</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- Size rows will be added here -->
                            </tbody>
                        </table>
                        
                        <script>
                            document.getElementById("addButton").addEventListener("click", function() {
                                const sizeSelect = document.getElementById("sizeSelect");
                                const selectedSize = sizeSelect.value;
                                const tableBody = document.getElementById("sizeTable").querySelector("tbody");
                        
                                // Check if the size is already in the table
                                let sizeRow = Array.from(tableBody.rows).find(row => row.cells[0].innerText === selectedSize);
                        
                                if (sizeRow) {
                                    // Increment the quantity if size already exists
                                    let quantityCell = sizeRow.cells[1];
                                    let quantity = parseInt(quantityCell.innerText, 10);
                                    quantityCell.innerText = (quantity + 1).toString().padStart(2, '0'); // Format as 2-digit
                                } else {
                                    // Create a new row for the new size
                                    const newRow = document.createElement("tr");
                        
                                    const sizeCell = document.createElement("td");
                                    sizeCell.innerText = selectedSize;
                                    sizeCell.style.borderRight = "1px solid black"; // Add border to separate columns
                                    sizeCell.style.padding = "10px";
                                    newRow.appendChild(sizeCell);
                        
                                    const quantityCell = document.createElement("td");
                                    quantityCell.innerText = "01"; // Start with quantity 1, formatted as 2-digit
                                    quantityCell.style.padding = "10px";
                                    newRow.appendChild(quantityCell);
                        
                                    tableBody.appendChild(newRow);
                                }
                            });
                        </script>
                        
                    </div style="grid-auto-rows: min-content;   display: grid;" >
                        <div>
                        <p style="background: bisque;  width: 50%;">Product Detail Description</p>
                        <textarea style="padding-bottom: 27%;" placeholder="Enter product description"></textarea>
        
                        <p>Discount</p>
                        <input type="number" placeholder="Enter discount value">
                        <button style="    margin-top: 80px;">Save & Publish</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
