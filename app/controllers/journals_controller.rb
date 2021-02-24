class JournalsController < ApplicationController 

    def index
        @journals = current_user.journals
    end

    def show
        @journal = Journal.find_by(id: params[:id])
    end

    def new
        @journal = Journal.new(horoscope_id: params[:horoscope_id])
        @journal.build_user
    end

    def create
        @journal = Journal.new(journal_params)
        @journal.user = current_user
        if @journal.save!
            redirect_to journal_path(@journal)
        else
            render :new
        end
    end

    def edit
        @journal = Journal.find_by(id: params[:id])
    end

    def update
        @journal = Journal.find_by(id: params[:id])
        if @journal.user = current_user
            @journal.update(journal_params)
            redirect_to journal_path(@journal)
        else
            render :edit
        end
    end

    def most_recent
        @journals = current_user.journals.most_recent
    end

    def destroy
        Journal.find(params[:id]).destroy
        redirect_to journals_path
    end

    private

    def journal_params
        params.require(:journal).permit(:user_id, :horoscope_id, :title, :description, :mood)
    end

end