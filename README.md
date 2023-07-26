[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/N1mlEqB1)
![BrightCoders Logo](img/logo.png)

# Proyecto final

> [Ver instrucciones antes de iniciar](./instructions/instructions.md)

This README would normally document whatever steps are necessary to get the application up and running.

Things you may want to cover:

## PROJECT DESCRIPTION
- For this project, we're aiming to do an e-commerce, we've set the fondations by selecting this theme as we believe
- it would be the most useful experience for us, as now days most transacctions around the world involves this kind of
- applications and solutions.
- As for our first session, we're going to have a ecommerce based on an client needs for selling caps, with deliveries in the same day for it's own city, managing it's own clients's orders, watching his products stocks, showing avaibility to clients, recieving feedback from them, etc.

## FEATURES
The site should be able to show pins, caps and cap cases, this products should be accesible from the navbar and also able to filter them by different attributes like their brand, also

### FUNCTIONAL REQUIEREMENTS
#### ADMIN (EXPECTED FUNCTIONS):
- Product handling (CRUD). The admin should be able to add, edit and delete products or services in the cap shop , including details like name, description, price, images.
- Orders handling (Change the status of the orders). The admin must have access to the list of orders placed by customers, be able to see the details of each order and update its status. (confimed, shipped, delivered)
- Dashboard (Orders, Sells, Low Stock). The admin can require reports and statistics on sales, income, best-selling products, to make informed decisions about the business.
- Send new orders to email
- See pending orders in the system
- The admin should have access to the general site settings such as shipping settings, taxes, currency.
- The admin must be able to check the inventory of available caps and receive alerts when stocks levels are low.
#### CLIENT (UNREGISTERED)
- Can see and filter products
- Can see details of a product
#### CLIENT (REGISTERED)
- Make orders
- Can modify it’s information
- Can see it’s orders history
- Can see it’s pending orders
- Allow to filter and search caps by attributes such as color, size or price.
- Show pictures and details of the caps on the product page.
- Allow customers to add products to the shopping cart and checkout.
- Send order confirmation notifications by email.

#### NON FUNCTIONAL-REQUIREMENTS
##### PERFORMANCE
- Page loading time must be fast to ensure a satisfactory user experience.
- The platform must handle high concurrency of simultaneous users without significant performance degradation.
- Response times for key actions (e.g., adding a product to the cart or making a order) should be quick and consistent.
- Intuitive design.
- Users can only see their orders.
##### MAINTAINABILITY
- The e-commerce platform's code must be well-structured and documented to f
- acilitate maintenance and future updates.
- It should follow best development practices to minimize the occurrence of errors and ease bug fixing.

#### SECURITY AND PRIVACY
- User's personal data must be encrypted and protected.
- Access to the administration panel must be protected by strong authentication.
- Activity and transaction logs must be stored securely and accessible only to authorized roles.
#### USABILITY
- The e-commerce interface must be intuitive and user-friendly for different types of users.
- Product navigation and search should be simple and effective.
- The platform must be responsive, adapting to different devices (PCs, tablets, mobiles).

## STRUCTURE OF THE DATABASE

### Users(Using devise) we need to add:
- First name.(Varchar)
- Last name. (Varchar)
- ID Order.(foreign key) (Int)

### Adress
- City  (Varchar)
- State (Varchar)
- ZIP Code (Int)
- Address. (Text)
- Phone-number. (Varchar)
- ID User. (foreign key) (int)

### Products
- Name (Visible) (Varchar) 
- Description (visible) (string) Optional
- Type (Visible) (Varchar)
- Brand (Visible) (Varchar)
- Image (Visible) (BLOB)
- Size (Visible) (Varchar) Optional
- Base-Price ( Not visible ) ( Float )
- Discount (Visible)( Float ) Optional
- Total-Price (Visible)  ( Float)
- Stock ( Int )  
- Availability (Visible) (Boolean)

### Orders
- Users_ID (Invisible)
- Product_ID (Invisible)
- Product_Total-Price (Visible)(Float)
- User_First_Namet-Name (Visible)
- User_Last-Name (Visible)
- User_City  (Visible)(Varchar)
- User_State (Visible)(Varchar)
- User_ZIP Code (Visible)(Int)
- User_Address. (Visible)(Text)
- User_Phone number. (Visible)(Varchar)
- Shipment-Type (Visible(admin-only))(Varchar)
- Order-Hour (Visible(admin-only))(Time)
- Order-Date (Visible)(Date)
- Product-Quantity (Visible)(Int)
- Order_Status


