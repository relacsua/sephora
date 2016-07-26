## Sephora Lite

##### Sephora Product Catalog

The app is live [here](https://afternoon-scrubland-62156.herokuapp.com/). Since images are not persisted on heroku, the images will not display. Check out the screenshots below for more info. The admin page can be accessed [here](https://afternoon-scrubland-62156.herokuapp.com/admin/categories).

Features Implemented:

* Admin page to manipulate data which includes categories, sub categories, sub sub categories as well as products
* Filtering can be carried either by pressing the navigating links on the navigation bar or the bread crumbs that appear when filtering products
* Categories without products are not shown on the navigation bar
* The `name` attribute on all the categories table is unique to prevent naming clashes

App Architecture:

* `Category` has one-to-many relationship with `SubCategory`
* `SubCategory` has one-to-many relationship with `SubSubCategory`
* `SubSubCategory` has one-to-many relationship with `Product`
* All CRUD operations can be carried out in the admin page.
* The user can only view the product.

### App Screenshots

##### Page displaying all products

![all products](https://github.com/relacsua/sephora/raw/master/screenshots/All_Products.png)

##### Product page after filters are added

![filtered products](https://github.com/relacsua/sephora/raw/master/screenshots/Filtered_Products.png)