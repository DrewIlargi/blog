class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

  def index
    #Obtenemos todos los articulos de la base de datos
    @articles = Article.all
  end
  #Mostrar articulos por su ID
  def show
    @article = Article.find(params[:id])
  end
  # Crear articulos nuevos y registrarlos con un formulario
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save 
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Editar articulos
  # Captura el articulo de la base de datos y lo almacena en @article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Destruir o eliminar elemento
  def destroy
    @article = Article.find(params[:id])
    @article.destroy 

    redirect_to root_path, status: :see_other
  end
  
  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
