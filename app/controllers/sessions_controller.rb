class SessionsController < ApplicationController

    def new
    end

    def create_from_facebook
        @user = User.find_by(email: auth.info.email)
        if @user != nil
          session[:user_id] = @user.id
          redirect_to user_path(session[:user_id])
        else
          @random_pass = SecureRandom.hex
          @user = User.new(email: auth.info.email, username: auth.info.email)
          session[:user_id] = user.id
          redirect_to user_path(session[:user_id])
        end
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

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

    # def session_params
    #     params.require(:user).permit(:name, :email, :password)
    # end
end