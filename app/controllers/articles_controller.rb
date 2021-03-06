class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end
  
  def create
    # render plain: params[:article].inspect <- displays submitted stuff as hash
    
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created"
      redirect_to article_path(@article)
    else # <- when validations not allowed article to be saved
      
      render :new
    end  
      
    # @article.save
    # redirect_to article_path(@article)
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
end