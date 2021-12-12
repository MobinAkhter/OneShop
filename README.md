# OneShop
Term Project for PROG31975 Advanced Mobile App Development with professor Jigisha Patel

OneShop is an application that acts like an ecommers application. Users are allowed to sing up, log in, select products, add to cart, and view store loactions to purchase them.

Roles:
Mobin - Sign Up/ Log In using Firebase Database as well as push notifcations. Push notifications did not work because initially to fix it to work properly in XCode, i deleted it which was not the right decision. The invite from the prof was then not able to be accepted since the apple ID linked with sheridan did not exist. 
Therefore, I am cleaning up the UI (throughout the app, making it appear more professional) and app flow. Next steps for me would be to implement google authentication, but this will be done in the winter break.

Anais - Allowing user to select products and placing them into shopping cart. Due to the over abundance of items and too many apis, they will be sepereated into categories and each csategories will. 
        contain items  which aren't desribed in specifcity (Ex: Instead of iphone, andriod or samsung, the product will be labeled as phone). 
        Displaying shopping cart view, due to issues with using the swift package manager which somehow gave me unkwon erros, Unfortunatly,I have to implement it the shopping cart without using the database. Scratch this, Jatin has implemented the database for the shopping cart.
        Location Services
       
        
       
Jatin - Saving user cart items in database. Help screen, launch screen, styling UI. 

 
Tyoe of nagivation : Hirarchal navigation but the app won't annoy user when during navigation

Progress so far: Log In and Sign Up Functionality is completed. View for selecting items, view for shopping cart and deleting items. 
Loaction Services (but cannot get the map view to display due to merging issues)

What's next : Help page, push notification and styling UI. 

9th December Update: 
Functionalities provided by the app: 
Register user along with necessary validation
Login user with validation
User is able to re-set their password through a link provided to their email incase they have forgotten it. Note, all the necessary user inputs are registered to Firebase for the backend to function properly in the latter stages of the app flow, such as shopping cart.
View available products
Geocoding
Mapview
Add items to shopping cart persistently via the use of local database so that it is for each user on the device.
Logout
Most importantly, Session Management has been handled, so for example if the user logs out, they can not access the app without logging in first. 

What's next: WatchOS (Jatin) and the few minor (recommnended) changes that are left. 
P.S, the screenshots below will be updated once the app has been finalized for submission


![registerSheet](https://user-images.githubusercontent.com/55329336/145449135-f55bd78b-ab03-4c61-b107-48cab1d3e1a1.png)
![login](https://user-images.githubusercontent.com/55329336/145449167-67083d27-84aa-4e07-937c-7c19ed0aac6b.png)

![resetPass![Hom![products2](https://user-images.githubusercontent.com/55329336/145449288-05e07d36-f378-4489-9acf-609711fd879d.png)
e](https://user-images.githubusercontent.com/55329336/145449221-c4a414c4-ae25-44e5-b40b-a531ace17fd8.png)
word](https://user-images.githubusercontent.com/55329336/145449196-92535194-e0e0-4832-99fb-1948bb15d3cf.png)
![products](https://user-images.githubusercontent.com/55329336/145449387-f636e26d-2f29-4b4f-8faa-63db29a130e6.png)
![productSuccess](https://user-images.githubusercontent.com/55329336/145449474-50266732-6189-4f2f-b1e3-e9fccbb909fc.png)
![shoppingcart](https://user-images.githubusercontent.com/55329336/145449508-38abdf46-98aa-4442-96d5-4ce8e8cb7253.png)
![coord](https://user-images.githubusercontent.com/55329336/145449608-92bf4c65-7194-49ef-89c3-b377991cbfa4.png)
![coordsc](https://user-images.githubusercontent.com/55329336/145449613-394a0c7b-a8fd-4f34-8bac-32d34d551d56.png)
