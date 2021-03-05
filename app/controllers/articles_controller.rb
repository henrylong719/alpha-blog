class ArticlesController < ApplicationController
  
  # it will run set_article before the listing actions 
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show

    # byebug

  end

  def index

    @articles = Article.all

  end
 

  def new

    @article = Article.new

  end

  def edit 

  end

  def create
    # render plain data in the page
    # {"title"=>"harry porter", "description"=>"this is harry porter"}
    # render plain: params[:article]

    #(whitelist) require the top level key of article and permit title and description from there to be used 
    # to create article instance
    @article = Article.new(article_params)
    # render plain: @article.inspect

    if @article.save
    
      flash[:notice] = "Article was created successfully."

      # ruby will extract id from @article object and use it to form the path
      # redirect_to article_path(@article) or
      redirect_to @article
    else
      render 'new'

    end

  end

  def update
    

    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    
    @article.destroy
    # redirect to the article listing page
    redirect_to articles_path
  end


  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  
end
