<%-- 
    Document   : WarehouseIventory
    Created on : Oct 25, 2024, 7:58:29 PM
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
        <link href="CSS/styles1.css" rel="stylesheet" /> 

    </head>

    <body>
        <style>
            .content {
                flex-grow: 1;
                padding: 30px;
                background-color: #f8f8f8;
            }

            .summary {
                display: flex;
                justify-content: space-between;
                margin-bottom: 30px;
                padding: 20px;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            .summary div {
                text-align: center;
            }

            .summary div span {
                display: block;
                font-size: 14px;
                margin-bottom: 10px;
            }

            .summary div h2 {
                font-size: 40px;
                margin: 0;
            }

            .inventory-list {
                background-color: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f4f4f4;
            }

            .button-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 50px;
                margin-top: 13px;
            }

            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #007bff;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-left: 10px;
            }

            .btn-secondary {
                background-color: #6c757d;
            }

            .btn-primary {
                background-color: #28a745;
            }

            .filter-container {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 10px;
            }

            .filter-input {
                display: flex;
                gap: 10px;
            }

            .filter-input input {
                padding: 5px 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .filter-input button {
                padding: 5px 22px;
                border: 1px solid #ccc;
                background-color: white;

                border-radius: 15px;
                width: 90px;
                margin: 8px;
            }
        </style>
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
                <div class="main-header">
                    <span class="title">Inventory Manage</span>
                    <div class="button-container">
                        <button class="btn btn-primary">Edit product</button>
                        <button class="btn btn-primary" onclick="window.location.href = 'AddInventory.jsp'">+ Add new</button>
                    </div>
                </div>
                <div class="summary">
                    <div style="display: flex;">
                        <img src="assets/inventory.svg" width="36" height="36" style="margin-right: 13px" />
                        <h1 style="
                            margin-top: -4px;
                            ">Inventory Summary</h1>
                    </div>
                    <div style="display: flex; justify-content: space-around;">
                        <div>
                            <h1>All products</h1>
                            <h2>100</h2>
                        </div>
                        <div>
                            <h1>In Store</h1>
                            <h2>75</h2>
                        </div>
                        <div>
                            <div style="margin: 5px;
                                 padding: 7px;
                                 border: solid;
                                 border-radius: 30px;
                                 border-color: orange;"> <h1 style="color: #626058 !important;">Low In-Stock</h1> </div> 
                            <h2>5</h2>
                        </div>
                    </div>

                </div>

                <div class="inventory-list">
                    <!-- Search and buttons bar -->
                    <div style="
                         display: flex;
                         justify-content: space-between;
                         align-items: center;
                         margin-bottom: 20px;
                         ">
                        <div>
                            <h1>Inventory List</h1>
                        </div>
                        <!-- Search section -->
                        <div style="display: flex; align-items: center; gap: 10px;">
                            <span style="font-weight: 500;">Search:</span>
                            <input type="text" placeholder="Enter Here" style="
                                   padding: 8px 12px;
                                   border: 1px solid #ccc;
                                   border-radius: 4px;
                                   width: 200px;
                                   ">
                            <button style="
                                    padding: 8px 16px;
                                    border-radius: 4px;
                                    border: 1px solid #ccc;
                                    background: white;
                                    cursor: pointer;
                                    ">Search</button>
                        </div>

                        <!-- Sort and Add new buttons -->
                        <div style="display: flex; gap: 16px; align-items: center;">
                            <button style="
                                    padding: 8px 16px;
                                    border-radius: 4px;
                                    border: 1px solid #1d81f3;
                                    background: transparent;
                                    color: #1d81f3;
                                    display: flex;
                                    align-items: center;
                                    gap: 8px;
                                    cursor: pointer;
                                    ">
                                <img src="assets/filter.svg" alt="sort" width="20" height="20">
                                Filter
                            </button>

                            <button  style="
                                     padding: 8px 16px;
                                     border-radius: 4px;
                                     border: 1px solid #1d81f3;
                                     background: transparent;
                                     color: #1d81f3;
                                     display: flex;
                                     align-items: center;
                                     gap: 8px;
                                     cursor: pointer;
                                     ">
                                <img src="assets/sort2.svg" alt="sort" width="20" height="20">
                                sort
                            </button>
                        </div>
                    </div>

                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Product Name</th>
                                <th>Size</th>
                                <th>Price</th>
                                <th>In stock</th>
                                <th>Discount</th>
                                <th>In Store</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Nike Full Force Low - Black / Fire Red</td>
                                <td>39</td>
                                <td>2.190.000</td>
                                <td>17</td>
                                <td>0</td>
                                <td>4</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Nike Full Force Low - Black / Fire Red</td>
                                <td>40</td>
                                <td>2.190.000</td>
                                <td>17</td>
                                <td>0</td>
                                <td>6</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Nike Full Force Low - Black / Fire Red</td>
                                <td>41</td>
                                <td>2.190.000</td>
                                <td>17</td>
                                <td>0</td>
                                <td>5</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
    </body>
</html>
