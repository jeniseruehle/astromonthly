class HoroscopesController < ApplicationController

    def index
        @horoscopes = Horoscope.all
    end

    def show
        @horoscope = Horoscope.find_by(params[:id])
    end
    

end