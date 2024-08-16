# Movie Management Project

This project is an application designed to manage a collection of movies, along with customer and purchase data. Below is an overview of the project structure and its main functionalities.

## Included Files

### `main.cpp`
This is the main file of the application. It contains the `main()` entry point and the core logic to manage the overall application, possibly including menu navigation, user interactions, and integration of various modules.

### `movies.cpp`
This file likely handles movie-related functionalities. It could include operations like adding, removing, or listing movies in a collection, along with additional details such as titles, genres, and ratings.

### `fecha.h`
This header file defines functions and structures related to handling dates, such as the release date of movies or expiration date of customer subscriptions.

### `producto.h`
This header file defines the structure for products that can be added to a shopping list, including attributes like name and price. This might be linked to selling or renting movies.

### `tarjeta.h`
This header file defines structures and functions related to managing credit cards, such as validating the card number and expiration date, possibly used for processing payments for movie purchases or rentals.

### `user.h`
This header file defines the structure of the user, including information such as name, address, email, and credit card number. This is crucial for managing customer profiles in the movie management system.

### `DatosCliente.txt`
This text file contains customer information, including:

- **Name:** Mauricio
- **Address:** Direccion
- **Email:** correo
- **Credit Card Number:** 1111111122222222
- **Expiration Date:** 12/26

### `listacompra.txt`
This text file contains a list of products added to a purchase, which might be relevant if movies are treated as purchasable items. In the example, it includes:

- **Beef:** $107.75

The total purchase amount is $107.75, which may serve as a placeholder or example in the context of the project.

## Functionalities

1. **Movie Management:**
   - Add, remove, and list movies in a collection.
   - Store and retrieve movie details, such as title, genre, and ratings.

2. **User Management:**
   - Register and store user data, such as name, address, email, and credit card information.
   - Manage user profiles and their associated movie collections or purchases.

3. **Product Management:**
   - Add products (possibly movies) to a shopping list with their respective prices.
   - Calculate the total purchase amount.

4. **Credit Card Validation:**
   - Verify credit card numbers and expiration dates to ensure valid transactions.

## Usage Instructions

1. **Compilation:**
   - Compile the `main.cpp`, `movies.cpp`, and all relevant header files (`*.h`) using a C++ compiler.

   ```bash
   g++ main.cpp movies.cpp -o movie_management
