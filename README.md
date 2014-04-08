## CB Flooring

####This webapp is still under construction.

###Description: 
I am building it for my brother. The ultimate goal is to have a website that displays a bunch of his galleryes, has some information about him and gives the visitor the ability to requet a quote. When a quote request is submited an email is sent to my brother with the name and phone number of the person that submits the request, I will probably provide a timeframe when the customer wants to be called. 

On the admin side, my brother's side, he will have the ability to create new albums, also view a list of unchecked requests, mark them as checked. If I will have time I may incorporate google calendars so he could schedule appointments directly on his calendar with the name, phone number and any other fields in this table. This readme will update as the projects evolves.

In case I haven't crashed the server it can be visited [here](http://cbflooringinc.com).

To test this code you need to have `imagemagick` installed if you have homebrew it can be installed with the command `brew install imagemagick`.


After you clone the repository assuming that you already have ruby and rails installed, the following commands will get you running:

1. `bundle install`

2. `bundle exec rake db:create`

3. `bundle exec rake db:setup`

4. `rails s` or `rails server`

Now you should be able to go to [http://localhost:3000](http://localhost:3000) and you should be on the home page. To be able to sign in as an admin you have to manually go to [http://localhost:3000/admins/sign_in](http://localhost:3000/admins/sign_in). The seed file automatically creates an admin with credentials email: `a@a.com` and password: `testtest`. And you can play with it from there. 

I will update this file with printscreens when I will have most of the functionality and styling finished.
