class SessionsController < ApplicationController
    def new 
    
    end
    def create
        user = User.find_by_email params[:email]
        #has_secure_password gives us the method authenticate used to 
        #check passwords
        #user& is a little bit of meta programming ,this is basically checks if
        #user is Not nil before trying to call .authenticate. This is to avoid 
        #no method errors.
        if user&.authenticate params[:password]
            session[:user_id] = user.id 
            #session is a hash that is available anywhere. Rails will grab all 
            #the information from session and create a cookie with the data.
            #A cookie is just a string of key value pairs
            #{ session: {user_id: 1}}
            flash[:success] = "User Logged In"
            redirect_to tasks_path
         else
            #flash is a hash in the form
            #flash = {warning: "Couldn't Sign In"}
            
            flash[:warning] = "Couldn't Sign In"
            #flash = {secondary: "what happened?"}
            flash[:secondary] = "what happened?"
            render :new 
        end
    end
end
