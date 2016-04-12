class QuotesController < ApplicationController
  def index
    @quotes = Quote.all.reorder('created_at DESC')
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new

    if @quote.save
      redirect_to quotes_path
    else
      flash[:error] = "Something went terribly wrong."
      redirect_to quotes_path
    end
  end

  %w(up down).each do |direction|
    define_method("vote_#{direction}") do
      @quote = Quote.find(params[:id])
      @quote.send("vote_#{direction}!".to_sym)

      if @quote.save
        flash[:notice] = "Vote saved!"
        redirect_to quotes_path
      else
        flash[:error] = "Something went terribly wrong."
        redirect_to quotes_path
      end
    end
  end
end
