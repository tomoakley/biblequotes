class QuotesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :edit]
    def index
        @page_title = "Home"
        @quote = Quote.all.sample
    end

    def show
        @quote = Quote.find(params[:id])
        @user = User.find(@quote.user_id)
        @quote_author = @user.username
        @quote_created = @quote.created_at.to_formatted_s(:long_ordinal)
    end
    
    def new
      @page_title = "New Quote"
      @quote = Quote.new
    end

    def edit
        @quote = Quote.find(params[:id])
    end

    def create
        @quote = current_user.quotes.build(quote_params)
        if @quote.save
            redirect_to root_url
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

