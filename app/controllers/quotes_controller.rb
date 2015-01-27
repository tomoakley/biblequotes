class QuotesController < ApplicationController
    def index
        @quote = Quote.all.sample
    end

    def show
        @quote = Quote.find(params[:id])
    end
    
    def new
        @quote = Quote.new
    end

    def edit
        @quote = Quote.find(params[:id])
    end

    def create
        @quote = Quote.new(quote_params)
        if @quote.save
            redirect_to @quote
        else
            render 'new'
        end
    end

    def update
        @quote = Quote.find(params[:id])
        if @quote.update(quote_params)
            redirect_to @quote
        else
            render 'edit'
        end
    end

    def destroy
        @quote = Quote.find(params[:id])
        @quote.destroy
        
        redirect_to quotes_path
    end

    private
        def quote_params
            params.require(:quote).permit(:title, :text)
        end

end

