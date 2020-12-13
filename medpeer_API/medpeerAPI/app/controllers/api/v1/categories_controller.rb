module Api
    module V1
        class CategoriesController < ApplicationController
            before_action :set_post, only: [:show, :update, :destroy]
            has_many :ideas, dependent: :destroy

            def index
              categories = Category.order(created_at: :desc)
              render json: { status: 'status', message: 'Loaded posts', data: categories }
            end
      
            def show
              render json: { status: 'SUCCESS', message: 'Loaded the post', data: @category }
            end
      
            def create
              categories = Category.new(post_params)
              if category.save
                render json: { status: '201', data: category }
              else
                render json: { status: '422', data: category.errors }
              end
            end
      
            def destroy
              @category.destroy
              render json: { status: 'SUCCESS', message: 'Deleted the category', data: @category }
            end
      
            def update
              if @category.update(post_params)
                render json: { status: 'SUCCESS', message: 'Updated the category', data: @category}
              else
                render json: { status: 'SUCCESS', message: 'Not updated', data: @category.errors }
              end
            end
      
            private
      
            def set_category
              @category = Category.find(params[:id])
            end
      
            def categories_params
              params.require(:category).permit(:name)
            end
          end
        end
    end
