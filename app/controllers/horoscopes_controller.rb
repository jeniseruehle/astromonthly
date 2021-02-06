class HoroscopesController < ApplicationController
    before_action :require_admin, only: [:new, :create, :edit, :update]

    def index
        @horoscopes = Horoscope.all
    end

    def show
        @horoscope = Horoscope.find_by(id: params[:id])
        # @journal = @horoscope.journals.build(user_id: current_user.id)
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
        # @journal = @horoscope.journals.build(user_id: current_user.id)
    end

    def update
        @horoscope = Horoscope.find_by(id: params[:id])
        @horoscope.update(horoscope_params)
        redirect_to horoscope_path(@horoscope)
    end

    private

    def require_admin
        if !current_user.admin?
            redirect_to horoscopes_path
        end
    end

    def horoscope_params
        params.require(:horoscope).permit(:ascendant, :content, :month_id)
    end

end