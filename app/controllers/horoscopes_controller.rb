class HoroscopesController < ApplicationController

    def index
        @horoscopes = Horoscope.all
    end

    def show
        @horoscope = Horoscope.find_by(params[:id])
    end

    def create

    end

    private

    def horoscope_params
        params.require(:horoscope).permit(:ascendant, :content, :month_id)
    end
    

end