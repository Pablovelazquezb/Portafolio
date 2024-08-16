# Movies Collection Program

This C++ program manages a collection of videos, movies, and series, allowing you to store and interact with them through predefined data. The program uses structures and vectors to organize the information.

## Structures

The program defines the following structures:

- **Video**: Represents a general video with the following attributes:
  - `title`: The title of the video.
  - `genre`: The genre of the video.
  - `rating`: The rating of the video.

- **Movie**: Represents a movie with similar attributes to `Video`:
  - `title`: The title of the movie.
  - `genre`: The genre of the movie.
  - `rating`: The rating of the movie.

- **Series**: Represents a TV series with the following attributes:
  - `title`: The title of the series.
  - `rating`: The rating of the series.

## Global Variables

- **videos**: A vector that stores `Video` objects.
- **movies**: A vector that stores `Movie` objects.
- **series**: A vector that stores `Series` objects.
- **generalRating**: A float variable that represents a general rating.

## Functions

### `loadData()`

This function loads a set of predefined `Video`, `Movie`, and `Series` objects into the corresponding vectors. This data includes titles, genres, and ratings for each type of media.

### Example Data

The `loadData` function loads the following sample data:

- **Videos**:
  - `"La caida de Edgar"` (Comedy, 8.5)
  - `"Me comi una salchipapa"` (Comedy, 9.0)

- **Movies**:
  - `"The Shawshank Redemption"` (Drama, 9.3)
  - `"The Godfather"` (Drama, 9.2)

- **Series**:
  - `"Breaking Bad"` (9.5)
  - `"Game of Thrones"` (9.3)

## How to Use

1. Clone or download the repository containing the `movies.cpp` file.
2. Compile the `movies.cpp` file using a C++ compiler.
   ```bash
   g++ movies.cpp -o movies
