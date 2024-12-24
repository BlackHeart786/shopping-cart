<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <%@ include file="includes/head.jsp" %>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #333;
            padding: 15px 20px;
            color: #fff;
            text-align: center;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            padding: 10px;
            margin: 0 10px;
            font-size: 1.2rem;
        }

        .navbar a:hover {
            background-color: #555;
            border-radius: 5px;
        }

        .all-product {
            font-size: 2.5rem;
            font-weight: bold;
            color: #333;
            text-align: center;
            margin: 2rem 0;
            padding: 1rem;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            max-width: 80%;
            margin-left: auto;
            margin-right: auto;
            border: 2px solid #ddd;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin: 20px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            height: 450px; 
        }

        .card img {
            width: 100%;
            height: 200px; 
            object-fit: contain; 
            border-radius: 8px;
            margin-bottom: 15px; 
        }

        .card:hover {
            transform: translateY(-10px);
        }

        .price {
            font-size: 1.5rem;
            color: #333;
            margin-top: 10px;
        }

        .category {
            font-size: 1rem;
            color: #777;
            margin: 5px 0;
        }

        .card-btn {
            margin-top: auto; 
            display: flex;
            justify-content: space-between;
        }

        .card-btn button {
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 48%; 
        }

        .card-btn button:hover {
            background-color: #0056b3;
        }

        .card-btn-add {
            background-color: #28a745;
        }

        .card-btn-add:hover {
            background-color: #218838;
        }

        .card-btn-buy {
            background-color: #dc3545;
        }

        .card-btn-buy:hover {
            background-color: #c82333;
        }

        footer {
            background-color: #333;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <%@ include file="includes/navbar.jsp" %>

    <div class="all-product">All Products</div>

    <div class="grid-container">
        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/camera.jpg" alt="camera">
                <p class="price">Price: ₹12000</p>
                <p class="category">Category: Camera</p>
                <input type="hidden" name="productId" value="camera123">
                <input type="hidden" name="productName" value="Camera">
                <input type="hidden" name="productPrice" value="12000">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/female-shoes.jpg" alt="female-shoes">
                <p class="price">Price: ₹320</p>
                <p class="category">Category: Female Shoes</p>
                <input type="hidden" name="productId" value="shoes456">
                <input type="hidden" name="productName" value="Female Shoes">
                <input type="hidden" name="productPrice" value="320">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/ladis-bag.jpg" alt="ladis-bag">
                <p class="price">Price: ₹400</p>
                <p class="category">Category: Ladies Bag</p>
                <input type="hidden" name="productId" value="bag789">
                <input type="hidden" name="productName" value="Ladies Bag">
                <input type="hidden" name="productPrice" value="400">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/laptop.png" alt="laptop">
                <p class="price">Price: ₹9980</p>
                <p class="category">Category: Laptop</p>
                <input type="hidden" name="productId" value="laptop101">
                <input type="hidden" name="productName" value="Laptop">
                <input type="hidden" name="productPrice" value="9980">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/men-suits.jpg" alt="men-suits">
                <p class="price">Price: ₹350</p>
                <p class="category">Category: Men Suits</p>
                <input type="hidden" name="productId" value="suit202">
                <input type="hidden" name="productName" value="Men Suits">
                <input type="hidden" name="productPrice" value="350">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/phone2.jpg" alt="Phone">
                <p class="price">Price: ₹3000</p>
                <p class="category">Category: Phones</p>
                <input type="hidden" name="productId" value="phone201">
                <input type="hidden" name="productName" value="MI Phone">
                <input type="hidden" name="productPrice" value="3000">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/samsung.jpg" alt="phone">
                <p class="price">Price: ₹24000</p>
                <p class="category">Category: Phones</p>
                <input type="hidden" name="productId" value="phone05">
                <input type="hidden" name="productName" value="Samsung Phone">
                <input type="hidden" name="productPrice" value="24000">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>

        <form action="CartServlet" method="POST">
            <div class="card">
                <img src="product-image/tv.jpg" alt="tv">
                <p class="price">Price: ₹7000</p>
                <p class="category">Category: TV</p>
                <input type="hidden" name="productId" value="Tv07">
                <input type="hidden" name="productName" value="TV">
                <input type="hidden" name="productPrice" value="7000">
                <input type="number" name="quantity" value="1" min="1">
                <div class="card-btn">
                    <button class="card-btn-add" type="submit">Add To Cart</button>
                    <button class="card-btn-buy">Buy Now</button>
                </div>
            </div>
        </form>
    </div>

    <%@ include file="/includes/footer.jsp" %>
</body>
</html>
