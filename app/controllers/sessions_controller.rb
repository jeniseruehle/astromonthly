class SessionsController < ApplicationController

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

    def GoogleAuth
        access_token = request.env["omniauth.auth"]
        user = User.from_omniauth(access_token)
        if user.present?
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def session_params
        params.require(:user).permit(:name, :email, :password)
    end

end