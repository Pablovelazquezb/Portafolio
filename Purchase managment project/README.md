# Purchase Management Project

This project is a simple application for managing purchases and customer data. Below is an overview of the project structure and its main functionalities.

## Included Files

### `main.cpp`
This is the main file of the application. It contains the `main()` entry point and the necessary functions to manage the core logic of the application.

### `fecha.h`
This header file defines the functions and structures related to date handling, such as the expiration date of credit cards.

### `producto.h`
This header file defines the structure of products that can be added to the shopping list, including attributes like name and price.

### `tarjeta.h`
This header file defines the structure and functions related to managing credit cards, such as validating the card number and expiration date.

### `user.h`
This header file defines the structure of the user, including information such as name, address, email, and credit card number.

### `DatosCliente.txt`
This text file contains customer information, including:

- **Name:** 
- **Address:** 
- **Email:** 
- **Credit Card Number:** 
- **Expiration Date:** 

### `listacompra.txt`
This text file contains a list of products added to the purchase. In the example, it includes:

- **Beef:** $107.75

The total purchase amount is $107.75.

## Functionalities

1. **User Management:**
   - Registration and storage of user data, such as name, address, email, and credit card information.

2. **Product Management:**
   - Add products to a shopping list with their respective prices.
   - Calculate the total purchase amount.

3. **Credit Card Validation:**
   - Verification of credit card number and expiration date.

## Usage Instructions

1. **Compilation:**
   - Compile the `main.cpp` file along with the header files (`*.h`) using a C++ compiler.

   ```bash
   g++ main.cpp -o purchase_management
