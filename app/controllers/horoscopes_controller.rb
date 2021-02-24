class HoroscopesController < ApplicationController
    before_action :require_admin, only: [:new, :create, :edit, :update, :destroy, :current_month]

    def index
        if params[:search]
            @horoscopes = Horoscope.where("content LIKE ?", "%" + params[:search] + "%")
        else
            @horoscopes = Horoscope.all
        end
    end

    def show
        @horoscope = Horoscope.find_by(id: params[:id])
    end

    def new
        @horoscope = Horoscope.new
    end

    def create
        @horoscope = Horoscope.new(horoscope_params)
        if @horoscope.save
            redirect_to horoscope_path(@horoscope)
        else
            render :new
        end
    end

    def edit
        @horoscope = Horoscope.find_by(id: params[:id])
    end

    def update
        @horoscope = Horoscope.find_by(id: params[:id])
        @horoscope.update(horoscope_params)
        redirect_to horoscope_path(@horoscope)
    end

    def destroy
        Horoscope.find(params[:id]).destroy
        redirect_to horoscopes_path
    end

    private

    def require_admin
        if !current_user.admin?
            redirect_to horoscopes_path
        end
    end

    def horoscope_params
        params.require(:horoscope).permit(:sign, :content, :month_id)
    end

end