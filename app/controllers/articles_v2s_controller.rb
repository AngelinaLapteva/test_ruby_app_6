class ArticlesV2sController < ApplicationController

  # show because that what we put in our routes.rb
  def show
    # we have to instainitiate article because we need it to be accessible on our views 
    # params is something which goes into url after /; ex: articles/1 (id of article is 1 )
    # byebug is debugger; wrute your variable in terminal where your rails is runnning, ex: params[:id] will return you current called id
    @article = ArticlesV2s.find(params[:id])
  end
end