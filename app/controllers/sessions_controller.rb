class SessionsController < ApplicationController

    def new
    end

    def create
        if auth
            @user = User.find_or_create_by(:email => auth["info"]["email"]) do |u|
               u.name = auth["info"]["name"]
               u.password = SecureRandom.hex
            end
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            user = User.find_by(email: params[:email])
            if user && user.authenticate(params[:password]) 
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                flash[:error] = "Uh oh! Login info incorrect, please try again."
                redirect_to login_path
            end
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end