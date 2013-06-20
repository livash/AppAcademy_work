class CatsController < ApplicationController
  def create
    p "THESE ARE THE PARAMS"
    p params
    p "THESE ARE THE CAT PARAMS"
    params[:cat]
    
    Cat.create!(params[:cat])
    
    redirect_to cats_url
  end

  def index
    @cats = Cat.all
  end

  def new
    render :new
  end
end
