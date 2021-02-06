class SessionsController < ApplicationController

    def welcome
    end

    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) 
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:error] = "Uh oh! Login info incorrect, please try again."
            redirect_to login_path
        end
    end

    # def facebook_login
    #     if auth
    #         user = User.find_or_create_by(user_id: auth["user_id"]) do |u|
    #             u.name = auth["info"]["name"]
    #             u.email = auth["info"]["email"]
    #         end
    #         session[:user_id] = user.id
    #         redirect_to user_path(user)
    #     end
    # end

    def destroy
        session.delete(:user_id)
        redirect_to '/'
    end

    private

    def session_params
        params.require(:user).permit(:name, :email, :password)
    end

    def auth
        request.env['omniauth.auth']
    end

end