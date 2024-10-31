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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />       
        <link href="CSS/styless.css" rel="stylesheet" />
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
        }
        .form-group {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: start;
        }
        .form-group p{
            margin: 0;
        }
        .main {
            display: grid;
            grid-template-columns: repeat(2,1fr);
            margin: 10px;
            display: flex;
            align-items: flex-start;
        }
        .main-1 input{
            width: 300px;
            padding: 10px;
            background-color: #EFEEEE;
        }
        .main-2 input {
            padding: 10px;
            width: 500px;
            background-color: #EFEEEE;
        }
        .form-group .add-size-group {
        display: flex;
        align-items: center;
        margin-top: 30px;
        gap: 10px;
    }

        .form-group .add-size-group select {
            width: 70px;
        }

        .form-group .add-size-group button {
            border-radius: 4px;
            background: #1d81f3;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        input[type="file"]{
            display:none;
        }
        label {
            color: #22A0DC;
            font-size: 18px;
            text-align: center;
            display: block;
            background-color: #E8F3FA;
            cursor: pointer;
            padding: 10px 5px;
            width: fit-content;
        }
        .main-image img {
            width: 350px;
            height: 300px;
            object-fit: cover;
            padding: 10px;
        }
        .upload-image {
            margin: 30px;
        }
        .image {
            display: flex;
            gap: 1rem;
            align-items: flex-start;
        }
        .additional-images p{
            font-size: 20px;
            font-weight: 700;
        } 
        td {
            padding-left: 20px;
        }
    </style>
    </head>
    <body>
         <div class="header">
            <div>
                <img src="assets/logo.svg" width="77" height="72" style="margin-left: 74px" />
                <img src="assets/logo2.png" width="110" height="27" />
                <a href="WarehouseInventory.jsp"><img src="assets/back-arrow.svg" width="24" height="30" style="margin-left: 27px" /></a>
                <img src="assets/home.svg" width="36" height="36" style="margin-left: 55px" />
                <span class="title" style="margin-left: 25px">HOME</span>
                <img src="assets/forward.svg" width="24" height="35" style="margin-left: 25px" />
                <span class="title accent-text" style="margin-left: 40px">
                    Inventory Manage
                    </span>
            </div>
            <div>
                <div class="logout-button">
                    <a href="LogoutControl" class="logout"><span class="title black-text">Logout</span></a>
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
                <form action="AddInventoryServlet" method="post" enctype="multipart/form-data">
                    <div class="inventory-item">
                        <div class="image-section">
                            <div class="image">
                                <div class="main-image">
                                    <img id="mainImage" src="img/default.png">
                                </div>
                                <div class="upload-image">
                                    <input name="image" type="file" id="file-input" accept="img/*" required>
                                    <label for="file-input">
                                    <i class="bi bi-upload"></i></i>Upload Image
                                    </label>
                                </div>
                            </div> 
                        </div>
                        <!-- Right Column (Form Inputs) -->
                        <div class="main">
                            <div class="main-1">
                                <div class="form-group">
                                     <p style="background: bisque;  width: fit-content; padding: 10px;">Product Name<p>
                                    <input class="input" type="text" name="name" placeholder="Enter name" required>
                                </div>

                                <div class="form-group">
                                    <p>Brand</p>
                                    <input class="input" type="text" name="brand" placeholder="Enter brand"required>
                                </div>

                                <div class="form-group">
                                    <p style="margin-top: 40px;">Selling Price</p>
                                    <input class="input" type="number" name="price" placeholder="Enter price" required>
                                </div>

                            <table id="sizeTable" style="width: 50%; margin-top: 20px; border-collapse: collapse;">
                                <thead>
                                    <tr>
                                        <th style="border-right: 1px solid black; padding: 10px;">Size</th>
                                        <th style="padding: 10px;">Quantity</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="size-quantiy-item">
                                        <td><input type="hidden" name="size" value="38">38</td>
                                        <td><input style="width: 60px;" type="number" name="quantity" class="quantity" min="0" value="0"></td>
                                    </tr>
                                    <tr class="size-quantiy-item">
                                        <td><input type="hidden" name="size" value="39">39</td>
                                        <td><input style="width: 60px;" type="number" name="quantity" class="quantity" min="0" value="0"></td>
                                    </tr>
                                    <tr class="size-quantiy-item">
                                        <td><input type="hidden" name="size" value="40">40</td>
                                        <td><input style="width: 60px;" type="number" name="quantity" class="quantity" min="0" value="0"></td>
                                    </tr>
                                    <tr class="size-quantiy-item">
                                        <td><input type="hidden" name="size" value="41">41</td>
                                        <td><input style="width: 60px;" type="number" name="quantity" class="quantity" min="0" value="0"></td>
                                    </tr>
                                    <tr class="size-quantiy-item">
                                        <td><input type="hidden" name="size" value="42">42</td>
                                        <td><input style="width: 60px;" type="number" name="quantity" class="quantity" min="0" value="0"></td>
                                    </tr>
                                    <tr class="size-quantiy-item">
                                        <td><input type="hidden" name="size" value="43">43</td>
                                        <td><input style="width: 60px;" type="number" name="quantity" class="quantity" min="0" value="0"></td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                            <div class="main-2">
                                <div class="form-group">
                                    <p style="background: bisque; padding: 10px; width: fit-content;">Product Detail Description</p>
                                    <input style="padding-bottom: 27%" main="description" placeholder="Enter product description" />
                                </div>

                                <div class="form-group">    
                                    <p>Discount</p>
                                    <input style="width: 300px" type="number" name="discount" placeholder="Enter discount value">
                                </div>
                                <button type="submit" style="margin-left:50px; margin-top: 80px;">Save & Publish</button>
                            </div>
                        </div>
                    </div>
                </form>
                
                <script>
                    const fileInput = document.getElementById('file-input');
                    const mainImage = document.getElementById('mainImage');

                    fileInput.addEventListener('change', function () {
                        const file = fileInput.files[0]; // Get the first file from the input
                        if (file) {
                            const reader = new FileReader(); // Create a FileReader to read the file
                            reader.onload = function (e) {
                                mainImage.src = e.target.result; // Set the main image src to the uploaded file's result
                            };
                            reader.readAsDataURL(file); // Read the file as a Data URL
                            } else {
                                mainImage.src = 'img/default.png'; // Reset to default if no file is selected
                            }
                    });
                </script>
                </div>
            </div>
        </div>
    </body>
</html>
