class  CategoriesController <  ApplicationController
    def index 
        # @categories = Category.all
        @categories = Category.paginate(page: params[:page], per_page: 3)
    end

    def new 
        @category = Category.new
    end

    def show 
        @category = Category.find(params[:id])
    end

    def create 
        @category = Category.new(categories_params)
        if @category.save 
            flash[:notice] = "Category was successfully created."
            redirect_to @category
        else 
            render 'new'
        end
    end

    private 
    def categories_params 
        params.require(:category).permit(:name)
    end
end