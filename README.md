# README

# Tune Geeks

A two-sided marketplace for buying and selling music media and memorabilia of all kinds

- App deployed to Heroku: https://tunegeeks.herokuapp.com/

- GitHub repo : https://github.com/mikeolivotto/tune-geeks
  
  

## Problem

In an increasingly digitised world, music fans often take their passion further by collecting memorabilia from their favourite artists to bring tangibility to what is otherwise an intangible experience.

Marketplaces that allow users to sell practically anything are so ubiquitous it has become difficult to effectively buy and sell anything that's more than a simple commodity or common item. Take for example, eBay; there are over [1.7 billion listings total](https://au.oberlo.com/blog/ebay-statistics#:~:text=There%20are%201.7%20billion%20listings%20on%20eBay.) while music memorabilia accounts for [just over 274,000 items](https://www.ebay.com.au/b/Music-Memorabilia/2329/bn_1843245) (about one one-thousandth of a percent!). Gumtree and Facebook Marketplace suffer from similar general-purpose positioning as well as being very geocentric, making it difficult to connect buyers and sellers outside of a given locale.

Selling such unique items on any of these platforms would mean missing potential buyers from other platforms, and buyers will potentially miss their golden opportunity to acquire a coveted item if they're not constantly checking the myriad marketplaces.

On the other end of the spectrum marketplaces serving the music fan community, such as Discogs, have proved there is an appetite for dedicated music marketplaces - they are [estimated to generate over $100 million annually](https://www.forbes.com/sites/cheriehu/2017/09/11/why-discogs-is-ready-to-serve-much-more-than-just-music/?sh=1c720b961506). Despite the obvious gap in the market for broader music collectibles, Discogs only provides a marketplace for music media (ie. Records, CDs, tapes, etc) .

**Solution:** a marketplace specifically for the buying and selling of rare, hard-to-find and collectible music-related items.



## About the app

### Purpose

Tune Geeks has been built to connect music fans anywhere in the world with rare, hard to find, and collectible music-related items from their favourite artists.



### Target Audience

- Fans looking to acquire unique, rare, hard-to-find and collectible music-related items from their favourite artists

- Dealers and fans looking to sell their music collectibles in a marketplace where they can easily attract their desired customers
  
  

### Tech Stack

#### Languages

- Ruby
- HTML 5
- CSS 3

#### Frameworks

- Rails
- Bootstrap 5

#### Database

- PostgreSQL

#### Platforms

- AWS S3
- Heroku
  
  

### Functionality & Features

#### Major features

* List memorabilia for sale
  * Sellers have ability to upload images to their own listing(s)
* Buy music memorabilia
* Browse listings
  * View all listings
  * Browse artists with associated listings available, and view those items
  * Search directly for an artist
* User authentication & authorisation
  * Only registered users may buy or sell memorabilia on the platform
  * Only sellers may edit their own listing(s)
  * A user may edit only their own profile
* User profiles
  * Information related to the user
  * User's items for sale
  * User's sold items (visible only to the user in their own profile)
  * User's purchased items (visible only to the user in their own profile)

#### Minor features

**The following relate to interesting aspects of the UX design or back-end functionality**

- Search box displays a random artist from the database as the placeholder text
  - This is to offer a useful suggestion to the user, rather than suggesting an artist that may not have any associated listings available
- Default images if user fails to upload
  - Profile avatar
  - Listing image
- Simultaneously check for and/or create artist when submitting a new listing
  - Listing table relies on a separate Artists table for normalisation purposes
  - There should be no duplicate Artist records
    - Upon submitting a new listing, the Artist table is checked for the existence of said artist
      - If artist exists in table, get artist_id and use it in the creation of the new Listing record
      - If artist does not exist in table, create a new record in Artist table, then send artist_id back to create Listing record

### Sitemap

![sitemap](/readme_images/sitemap.png)



 ### User Flow

![user flow](/readme_images/user-flow.png)



### Screenshots

#### Home Page

![Screen Shot 2021-08-10 at 6.13.43 pm](/readme_images/ss-home-dt.png)



![Screen Shot 2021-08-10 at 6.15.13 pm](/readme_images/ss-home-mb.png)



![Screen Shot 2021-08-10 at 6.15.43 pm](/readme_images/ss-all-dt.png)



![Screen Shot 2021-08-10 at 6.16.18 pm](/readme_images/ss-all-mb.png)



![Screen Shot 2021-08-10 at 6.16.40 pm](/readme_images/ss-profile-dt.png)



![Screen Shot 2021-08-10 at 6.16.55 pm](/readme_images/ss-profile-mb.png)





## Planning & Development

### User Stories

- As a buyer, I want locate my favourite artist so I can find items specifically related to them

- As a buyer, I want to find out all the item details so I know the quality of the piece I might purchase

- As a buyer, I want to pay through the platform so that I can feel more secure in the transation

- As a buyer, I want to know the total cost of an item so there are no surprises

- As a buyer, I want to know who I am buying from so I can be assured of a safe and smooth transaction

- As a buyer, I want to know what I have purchased in the past so I don't mistakenly buy duplicates

- As a buyer, I want to know what other items a seller has so I might be able to find even more related/quality items that interest me

- As a buyer, I want to be able to discover interesting items to add to my collection

- As a buyer, I want to also be able to sell items from the same account so that I don't need to sign into different accounts

  

- As a seller, I want to be able to provide thorough information so that I can give my item the best chance of selling

- As a seller, I want to know who is buying from me so I can be assured of a safe and smooth transaction

- As a seller, I want my listings to be easily discoverable to collectors interested in my item, to increase the chances of it selling

- As a seller, I want to know what I have sold so I can keep track of sales

- As a seller, I want to also be able to buy other sellers' items on the same account so that I don't need to sign into different accounts



### Wireframes

![Navigation](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/Navigation.png)

#### ![Homepage](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/Homepage.png)

![Listings](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/Listings.png)

![Artist page](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/Artist page.png)

![Item page](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/Item page.png)

![List an item](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/List an item.png)

![Profile](/Users/michaelolivotto/Documents/CA/assignments/T2A2/docs/Wireframes/Profile.png)



### Entity Relationship Diagram (ERD)



![erd](/readme_images/ERD.png)



### High-level components (abstractions)

As in a typical Rails app, Tune Geeks follows the Model-View-Controller design pattern

#### Models

The models within the app are used to implement the data-related logic within the app, handling complex queries and establishing relationships across the database (discussed further below). 

- **Artist** - a fairly simple model associated to a table that holds all artists associated with listings. Two class methods have been created
  - self.random: pulls a random artist from the Artist table. Used in the search function to display a suggested artist as Placeholder text
  - self.currently_listed: in several places within the app, it is helpful to users to see only artists that have associated listings available for sale. This method returns only artists meeting this criteria
  - Validation ensures that an artist's name must be present to create an Artist record
- **Listing**
  - self.artist_in_db - querying the database to check if an artist exists
  - self.search(query) - used for search function to check if an artist has been provided, returning listings from that artist if they exist in the DB and have listings, otherwise returning all Listings from all artists
  - Validations ensure a new listing must include an item name, the associated artist, and price (A description and image are not necessary, thus they are not validated)
- Profile
  - Validations ensure a username is entered, and that it is unique. A first name is also validated.

Other models, including **Order**, and **User** have been set up in order to establish database relationships. Additional models include **Address** and **Review** which have been created in anticipation of additional features in future.

#### Views

The app views provide an interface to the app, allowing users to interact with the app and retrieve information.

- **Layouts** - provide the base templated structure to all pages within the app
- **Partials** - similar to layouts, but are smaller re-usable components that can be inserted into other views as necessary
  - Navbar - Featured on all pages of the app, but separated out as a partial to tidy up code and keep it manageable
  - Footer - as above
  - Search - Used on the homepage and a small subset of pages
- **Devise **(users) - All views are auto generated from the Devise gem, which provides an authentication system. Views here provide an interface for users to create, update and recover accounts
- **Profiles** - Interfaces for interacting with individual profiles.
  - New - Where a user can input details to create a profile, including their name, a username, and upload a profile avatar.
  - Edit - Interface to allow a user to update their profile details
  - Show - Where users can view their own - or other users' - profile
- **Home** - The view provided to the 'root' path of the app, serving as the entry point. It is set up to allow the user to intuitively understand the point of the app and how to navigate it, with links to login/sign up, view listings, or search the app (the search function logic being handled by the Listing model, as described above)
- **Listings** - Handles the many interfaces required dealing with items for sale
  - Index - For displaying all currently available items in a table with basic info such as Item name, price, and short description
  - Show - Display a given item's listing, with all details such as title, artist, price, and seller
  - New - Interface for a user to create a new listing and input all details, along with uploading pictures. Sends a post request upon form submission.
  - Edit - Similar interface to new, with the controller allowing the user to update the details of a given listing. Sends a put/patch request upon form submission. Authentication provided in controller to only allow item seller to make edits
    - Partials
      - Form - re-used component across the 'new' and 'edit' views
      - Listing-button - complex component with code parted out into a partial for readability and manageability
      - Listing-images - as above
- **Artists**
  - Index: Displays all artists in the database with associated current listings available for purchase (the self.random class method mentioned in the Model section is used here)
  - Show: Displays all the available and previously sold items for a given artist.
- **Orders** - Interface to show and handle order-related information. Basic implementation only at time of submission, with intention to create further views as additional features are built in future.
  - New - Serves as a 'confirm order' page sending a 'post' method to create the order upon clicking the Purchase button



#### Controllers

Process the logic and requests to deliver reviews and requested information.

- **Application controller** - All subsequent controllers inherit business logic from this top level controller. Specifically, this controller sets up a method to run authentication when certain controller actions require in.
- **Artists**
  - Sets up instance variables
    - @artist - sets variable to the artist with ID passed in as params. Made available only to 'Show' action
    - @available_items - contains currently "For Sale" listings by the artist set in @artist. Made available only to 'Show' action
    - @sold_items - contains "Sold" listings by the artist set in @artist. Made available only to 'Show' action
- **Home**
  - Page controller action matches to the standard homepage
- **Listings**
  - Authorises users to access edit/update/destroy actions
  - Sets variable (@listing) to the listing with ID passed in as params. Required for show/edit/update/destroy actions
  - Sets up a method to ensure only trusted parameters are allowed through
  - Index - Sets up instance variables
    - @listings - contains listings of given artist searched for
    - @listings_for_sale - contains listings of any given artist where status is "For Sale"
    - @artist_in_db - calls self.artist_in_db method from the model to determine if the artist passed through as params exists in the DB
  - New - Instantiates a new listing record (@listing).
    - Additional complex logic is implemented to check if the artist entered into the form already exists in the database.
      - If the artist does exist, the artist_id is fetched from the Artist table and sent back to act as the Foreign Key value in the new record
      - If the artist does not exist, a record is created for them in the Artist table, and the artist_id is then sent back 
- **Orders**
  - Instantiates a new order (@order) in the 'new' action, and follows up by updating the Listing status to sold if the order successfully saves on submission.
- **Profiles**
  - Authorises users to access edit/update/destroy actions
    - Show - Sets up instance variables
      - @current_listings - contains Listings for the current profile where the listing status is currently "For Sale".
      - @sold - contains Listings for the current profile where the listing status is "Sold".
      - @bought - contains Listings the current profile has bought



### Third Party Services / Gems

**Devise** - An authentication gem with complete MVC solution. Devise allows for a very simple to setup yet robust solution to provide authentication to the app, meaning the app can allow users to sign up and sign in, and subsequently display different views to the user based on their authorisation to see certain elements (eg. a user should only be allowed to see their own personal details and previously bought/sold items).

**Simple Form** - A ruby gem that allows for easy creation of forms with labels, and rendering errors by default when rendering the form with invalid data. Helpfully, it checks the databse for data types applicable to each column, and automatically renders an appropriate form type (eg. if the column has a `:text` data type, Simple Form will render a `textarea` input)

**Bootstrap** - Bootstrap has been used comprehensively in the design of the app to simplify the front end development, ensuring the app has a professional and consistent look. Many pre-made components such as cards and nav bars have been used throughout the site and further custom-styled using a variety of Bootstraps included classes

### App models

The models have been set up with defined associations that allow them to be related to each other in specific ways. For example, if an Address *belongs to* a user's Profile, then the profile also *has one* address, allowing queries to run in both directions - ie. It would be possible to query for a Profile's associated address, or to query for the Profile the address belongs to.

This is all facilitated by Rails' ActiveRecord associations, which simplify queries for manipulating data. An outline of the defined relations on each model is listed below:

#### Major models

- **Users**
  - **has_one :profile** - A user can only have one profile set up
- **Profiles**
  - **belongs_to :user** - A profile is attached to a User
  - **has_one_attached :avatar** - A profile can have an avatar (profile image), but only one
  - **has_one :addres**s - A profile can only have one associated address
  - **has_many :listings, foreign_key: 'seller_id'** - A profile can can sell many different items. The listings table uses a 'seller_id' foreign key, which is simply 'profile_id' renamed in a way that is more logical to the relation
  - **has_many :orders, foreign_key:'buyer_id'** - A profile can be a 'buyer' of many different orders. The order table uses a 'buyer_id' foreign key, which is simply 'profile_id' renamed in a way that is more logical to the relation
  - **has_many :reviews, foreign_key: 'reviewer_id'** - A profile can leave a reviews across orders they are a buyer or seller of. The reviews table uses 'reviewer_id' and 'review_id' foreign keys, which are simply 'profile_id' renamed in a way that allows the review to be associated to two separate profiles at once
  - **has_many :reviews, foreign_key: 'reviewee_id'** - as above
- **Listings**
  - **belongs_to :artist** - Each listing naturally relates to only one artist
  - **belongs_to :seller, class_name: 'Profile'** - Each listing is associated to a user who sells the item (the seller). The class name indicates that 'seller' is a renamed 'profile_id' foreign key
  - **has_many_attached :images** - A listing can have many images associated to it
  - **has_one :order** - Once an item sells, an order is created. A listing can only have one order
- **Artists**
  - **has_many :listings** - Any given artist may have zero or more listings that are related to them
- **Orders**
  - **belongs_to :listing** - Each order naturally relates to a single listing
  - **has_many :reviews** - a review can be left in each direction between buyer and seller (ie. 2 reviews are possible for each order)

#### Not yet integrated

- **Address**
  - belongs_to :profile - An address is attached to a user
- **Reviews**
  - **belongs_to :order** - Each review is associated to an order
  - **belongs_to :reviewee, class_name: 'Profile'** - Each review is associated to a user who receives the review (the reviewee). The class name indicates that 'reviewee' is a renamed 'profile_id' foreign key
  - **belongs_to :reviewer, class_name: 'Profile'** - Each review is also associated to a user who gives the review (the reviewer). The class name indicates that 'reviewer' is a renamed 'profile_id' foreign key



Expanding on the ActiveRecord associations and how they work, using the above relations as examples, it is possible to query the database for something like 'select all the listings that belong to the profile with an ID of 1' with a statement like `Profile.first.listings`. This returns all listings from the user with a Profile ID of 1.

The reverse of the above scenario is also possible. Keeping in mind that the foreign key to 'Profile' has been renamed as 'Seller', so a query statement of `Listing.first.seller` would return the profile belonging to the user selling an item (listing) with ID of 1.

An example of the `has_many` relationship would be querying for `Profile.first.orders`, which would produce all the orders belonging to the user with a profile ID of 1.



### Database relations

Each table in the database is related to one or more other tables. These relations, or links, occur through the definition of foreign keys which effectively tell the database that a given record is associated to another table whose primary key matches the foreign key. This is best visualised through the ERD provided earlier, with arrows drawing direct connections between each table and the direction in which they go to get the data.

Each table in the database is outlined below, with it's corresponding columns and data types

#### Users

- id [integer] - Primary key to the table
  - What the foreign key in the 'Profiles' table points to
- email [string]
- password [string]

#### Profiles

Has the most complex set of relations in the database. Referring to the ERD, all but one table has relations to the Profiles table.

- id [integer] - Primary key to the table
  - Primary key to the table
  - What foreign key in Addresses and images table points to
  - Also the foreign key in Listings (as 'seller'), Orders (as 'buyer'), and Reviews (as both 'reviewer' and 'reviewee' as appropriate)
- username [string]
- first_name [string]
- last_name [string]
- avatar [attached image]
- user_id [integer] - Foreign key to User table's primary key

#### Addresses

Very simple relation to a single other table (Profiles)

- id [integer] - Primary key to the table
- address_one [string]
- address_two [string]
- city [string]
- state [string]
- postcode [integer]
- country [string]
- profile_id [integer] - Foreign key to Profile table's primary key

#### Images

As visualised in the ERD this table sits 'in the middle' of the database, as it is used to store images that may be for a user's profile, or an item listing.

- id [integer] - Primary key to the table
- profile_id [integer] - Foreign key to Profile table's primary key - only necessary when image is an avatar for a profile
- listing_id [integer] - Foreign key to listing table's primary key - only necessary when image relates to an item for sale
- title [string]
- description [text]
- image_path [string]

#### Listings

- id [integer] - Primary key to the table
- name [string]
- artist_id [integer] - Foreign key to Artist table's primary key 
- price [decimal]
- description [text]
- images [attached]
- status [string]
- seller [integer] - renamed Foreign key to Profile table's primary key

#### Orders

Acts largely as a join table with only foreign keys (aside from the primary key), as all other details relevant to the order (buyer, seller, item, etc) are found in other tables.

- id [integer] - Primary key to the table
- listing_id [integer] - Foreign key to Listing table's primary key 
- buyer [integer] - renamed Foreign key to Profile table's primary key

#### Reviews

- id [integer] - Primary key to the table
- order_id [integer] - Foreign key to Order table's primary key 
- rating [integer]
- review [text]
- reviewee [integer] - renamed Foreign key to Profile table's primary key
- reviewer [integer] - renamed Foreign key to Profile table's primary key

#### Artists

- id [integer] - Primary key to the table
- name [string]



### Database schema design

![db schema](/readme_images/db schema.png)

### Task allocation and tracking

**Trello**: https://trello.com/b/vFfAWb3u/tune-geeks



The planning and development stages were split into roughly three stages, each approximately one week in length:

1. Project planning and initial setup, including:
   - Database design and ActiveRecord associations with renaming foreign keys where suitable
   - Wireframing
   - Initial Rails setup, installation of gems and database migrations
   - AWS S3 setup
2. Build out of the MVP focusing on
   - Only the absolutely necessary models, views, and controllers (this meant putting Reviews and Address features on the backlog)
   - Ensuring all controllers always provide correct data
   - Basic styling
3. Improvements, documentation, and additional features (time permitted)
   - Improved styling and improving UX
   - README.md
   - Working through the backlog



Throughout the planning and development stages, Trello was the task management tool of choice to keep track of all tasks as they progressed from To-do right through to Done, with additional columns for Doing and the Backlog for wishlist tasks. At the outset of planning, tasks were scheduled in that would cover all aspects of the MVP. From there, additional tasks were scheduled in to manage bug fixes or feature expansions if they could sufficiently improve the product with a reasonable amount of effort with the time available in the schedule.

With the exception of the backlog, each task was given a label of priority, either 'High', 'Medium', or 'Low', assisting in the prioritisation of tasks requiring work. Must-have features were also given deadlines to keep the project on schedule. Some items in the first week were taking a little longer than anticipated; the insight into upcoming tasks allowed future tasks to be easily deprioritised, re-ordering or moving to the backlog when necessary.

![trello](/readme_images/trello.png)