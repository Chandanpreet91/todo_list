class User < ApplicationRecord
    has_secure_password
    #Authentication
    #1.We need to have users in our app to authenticate 
    #2.and that including Sign Up (registeration or create a user
    # in user's table) and Sign In(creating a session)

    #We use bcrypt to secure the password and save them as a 
    # hash in our user's table ,And for that we need 
     # 1- User's table
     # 2- bcrypt gem
     # 3- a field in user's table thats called password_digest
     # 4- having has_secure_password in user model
end
