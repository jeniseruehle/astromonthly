class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = "Uh oh! Please fill out all fields to create account."
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        redirect_to root_path if !@user
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

end