1. Clone the Repository from GitHub
2. Open the project folder in VS code
3. Install Dependencies - Run the following command to install all composer dependencies:
composer install
4. Copy .env File - cp .env.example .env
5. Generate Application Key - php artisan key:generate
6. Configure Database: Edit the .env file to set up the database connection:
Set the database name.
DB_DATABASE=product_management_db
7. Create the Database in phpmyadmin
8. Run Migrations & Seeders: php artisan migrate --seed
9. Set Up Storage & Permissions: php artisan storage:link
10. Set Folder Permissions: For Linux/macOS: chmod -R 777 storage bootstrap/cache
11. Run the Laravel Server: php artisan serve
12. Run Each Module (Use postman)
    1. User Authentication: Endpoint: POST /api/register
    2. Login Endpoint: POST /api/login
    3. Product Management (Only for admin): Endpoint: POST /api/products : (Headers:Authorization: Bearer <your-token>)
    4. Update Product : Endpoint: PUT /api/products/{id}
    5. Delete Product : Endpoint: DELETE /api/products/{id}
    6. List Products (Public) : Endpoint: GET /api/products
    7. Get Top Ordered Products: Endpoint: GET /api/product/top-ordered
    8. Get Categories (Cached): Endpoint: GET /api/categories
    9. For managing Users : Endpoint: GET api/users
    


