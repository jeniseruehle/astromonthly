class MonthsController < ApplicationController

    def index
        @months = Month.all
        @horoscopes = Horoscope.all
    end

    def show
        @horoscopes = @month.horoscopes.all
    end

    private

    def choose_month
        @month = Month.find(params[:id])
    end

end