class CategoryController < ApplicationController

    def show
        @category = Category.find_by(type: params[:type])
    end

    def new
        
    end

    def create

    end

end
