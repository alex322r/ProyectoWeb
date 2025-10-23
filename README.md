# ProyectoWeb - Consultorio Psicológico

This is a web application for a psychological practice.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

*   PHP 8.0 or higher
*   Composer
*   MySQL

### Installation

1.  **Clone the repository**
    ```bash
    git clone <your-repository-url>
    cd ProyectoWeb
    ```

2.  **Install dependencies**
    ```bash
    composer install
    ```

3.  **Database Setup**
    *   Create a new MySQL database.
    *   Import the `consultorio-psicologico.sql` file into your database. This will create the necessary tables and data.
    ```bash
    mysql -u your_username -p your_database_name < consultorio-psicologico.sql
    ```

4.  **Web Server Configuration**
    *   Configure your web server (e.g., Apache, Nginx) to use the `public` directory as the document root.
    *   Ensure URL rewriting is enabled to handle routing.

## Usage

Once the installation is complete and your web server is configured, you can access the application by navigating to the URL you've set up.

*   **Login:** `/login`
*   **Dashboard:** `/dashboard` (requires authentication)

## Built With

*   [PHP](https://www.php.net/) - The web framework used
*   [Bramus/Router](https://github.com/bramus/router) - Routing
*   [MySQL](https://www.mysql.com/) - Database

