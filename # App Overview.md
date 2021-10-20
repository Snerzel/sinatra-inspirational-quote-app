# App Overview

I am building a inspirational quotes app. In this app you can create an inspirational quote.


# Users will be able to..

-log in, sign up, and logout

# As a user, I can..

-create an inspirational quote.
-see all my inspirational quotes.
-edit any of my quotes.
-delete any of my quotes.

# Wireframing 

## Models User and InspirationalQuote

## User

### Attributes

-name
-email
-password(with bcrypt password digest)

### Associations 

has_many :inspirational_quotes

## InspirationalQuote

### Attributes

-content
-user_id
-date

### Associations 

belongs_to :user

# MVP

Users can, sign up, log in, log out, create quotes, edit quotes, and view all quotes

# Stretch Goals 

-ability to set quotes as privite 
-ability to favorite quotes