<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        .d-flex {
            display: flex;
        }
        .flex-column {
            flex-direction: column;
        }
        .flex-shrink-0 {
            flex-shrink: 0;
        }
        .p-3 {
            padding: 1rem;
        }
        .text-white {
            color: white;
        }
        .nav-link {
            color: white;
            text-decoration: none;
            padding: 10px;
        }
        .nav-link:hover {
            background-color: #6c757d;
            border-radius: 5px;
        }
        .pe-3 {
            padding-right: 1rem;
        }
        .fa-solid, .fa-brands {
            margin-right: 10px;
        }
        img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            display: block;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <div class="d-flex flex-column flex-shrink-0 p-3 text-white" style="height: 100vh; width: 250px; background-color: #8c8377">
            <div class="d-flex flex-column justify-content-center align-items-center">
               
                <p style="text-align: center; font-size: 20px; margin-top: 10px">Administrator</p>
            </div>
            <hr>
            <ul class="nav nav-pills flex-column mb-auto">
                <li>
                    <a href="Administrator" class="nav-link d-flex align-items-center">
                        <i class="fa-solid fa-house pe-3"></i>
                        Home
                    </a>
                </li>
                <li>
                    <a href="manageReportUsers" class="nav-link d-flex align-items-center">
                        <i class="fa-solid fa-chart-simple"></i>
                        Manage Report Users
                    </a>
                </li>
                <li>
                    <a href="manageReportPost" class="nav-link d-flex align-items-center">
                        <i class="fa-solid fa-chart-simple"></i>
                        Manage Report Posts
                    </a>
                </li>
                <li>
                    <a href="ListUser" class="nav-link sidebarBtn">
                        <i class="fa-brands fa-product-hunt pe-3"></i>
                        List User
                    </a>
                </li>
                <li>
                    <a href="" class="nav-link sidebarBtn">
                        <i class="fa-solid fa-user pe-3"></i>
                        Customers
                    </a>
                </li>
                <li>
                    <a href="ListAll" class="nav-link sidebarBtn">
                        <i class="fa-solid fa-list pe-3"></i>
                        All
                    </a>
                </li>
            </ul>
            <hr>
        </div>
    </div>
</body>
</html>
