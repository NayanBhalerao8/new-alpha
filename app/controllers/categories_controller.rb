class  CategoriesController <  ApplicationController
    before_action :require_admin, except: [:index,:show]
    def index 
        # @categories = Category.all
        @categories = Category.paginate(page: params[:page], per_page: 3)
    end

    def new 
        @category = Category.new
    end

    def show 
        @category = Category.find(params[:id])
        @articles = @category.articles.paginate(page: params[:page], per_page: 3)
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

    def edit
        @category = Category.find(params[:id])
    end
    
    def update
        @category = Category.find(params[:id])
        if @category.update(categories_params)
            flash[:notice] = "Category name updated successfully"
            redirect_to @category
        else
            render 'edit'
        end
    end

    private 
    def categories_params 
        params.require(:category).permit(:name)
    end 

    def require_admin
        if !(logged_in && current_user.admin?)
            flash[:notice] = "Only admins can create a category"
            redirect_to categories_path
        end
    end
end