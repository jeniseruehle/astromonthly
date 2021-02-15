class MonthsController < ApplicationController
    before_action :get_month, only: [:show]

    def index
        @months = Month.all
        # @horoscopes = Horoscopes.all
    end

    def show
        @horoscopes = @month.horoscopes.all
    end

    private

    def get_month
        @month = Month.find(params[:id])
    end

end