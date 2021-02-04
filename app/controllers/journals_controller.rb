class JournalsController < ApplicationController


    def create
        journal = Journal.create(journal_params)
    end

    private

    def journal_params
        params.require(:journal).permit(:user_id, :horoscope_id, :title, :description, :mood)
    end



end