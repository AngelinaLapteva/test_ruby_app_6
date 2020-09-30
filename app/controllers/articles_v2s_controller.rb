class ArticlesV2sController < ApplicationController

  # this before action will be prefomerd nefore any aaction in this controller
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # show because that what we put in our routes.rb
  def show
    # we have to instainitiate article because we need it to be accessible on our views 
    # params is something which goes into url after /; ex: articles/1 (id of article is 1 )
    # byebug is debugger; wrute your variable in terminal where your rails is runnning, ex: params[:id] will return you current called id
    # @article = ArticlesV2s.find(params[:id])
  end

  # create an index.html.erb in your articles_v2s folder, in order to see data from function
  def index
    @articles = ArticlesV2s.paginate(page: params[:page], per_page: 4)
  end

  def new
    @article = ArticlesV2s.new
  end

  def edit
    # we need to instainitiate @article because we use it in our edit.html.erb params is reserved word and comes from url we reuqest
    # @article = ArticlesV2s.find(params[:id])
  end

  # should be name of the table in params
  def create
    # render will actually render plain json of what was created as text into our page 
    # render plain: params[:articles_v2s]

    # require means =< require top level key of created article and permit to save its data
    @article = ArticlesV2s.new(artcle_params)
   
    # assigned user on creation of article
    @article.user = User.first
    # render plain: @article
    # to show more details
    # render plain: @article.inspect 

    # article.save will return true if it was sucessfully saved into DB
    if @article.save
      flash[:notice] = "Article was created sucessfully"
        # after saving we want to show what was saved (we add _path to our model/table name) or just our created @article:
      redirect_to @article
    else
      render 'new'
    end
  end
  
  def update
    # @article = ArticlesV2s.find(params[:id])
    if @article.update(artcle_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    # @article = ArticlesV2s.find(params[:id])
    @article.destroy
    redirect_to articles_v2s_path
  end

  private 
  def set_article
    @article = ArticlesV2s.find(params[:id])
  end

  def artcle_params
    params.require(:articles_v2s).permit(:title, :description)
  end
end