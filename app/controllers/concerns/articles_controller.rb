class ArticlesController < ApplicationController
  def show
    #byebug
    @article = Article.find(params[:id])
  end

  def index
    # created variable so articles/new does not give Empty Class Error
    @articles = Article.all
  end

  def new
    @article  = Article.new()
  end

  def edit

    @article = Article.find(params[:id])
  end

  def create
    # Whitelisted the title and description fields of Article to be filled from the form

    @article = Article.new(params.require(:article).permit(:title, :description))
    #render plain: @article
    #
    # If article was successfully saved
    if @article.save

      # render plain: params[:article]
      #
      # We just created an article it would make sense to show the 'show' page
      # redirected to show page
      # path is given by: prefix(from routes)_path(@article - id of the article is stored here)
      redirect_to article_path(@article)
      # display a message using Rails' flash functionality
      flash[:notice] = "Article was created successfully"
    else
      flash[:notice] = "Article was created unsuccessfully"
      render 'articles/new'
      end
    # ^ Can also be written as redirect_to @article

    # Can also be redirected to a URI like
    # redirect_to '/articles'
    # Or to a prefix_path
    # redirect_to root_path
    # For further information look up redirect_to documentation

  end

  def update

    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article is updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end


end