module Api
  module V1
    class IdeasController < ApplicationController
          before_action :set_post, only: [:show, :update, :destroy]
          belongs_to :category

          def index
            ideas = Idea.order(created_at: :desc)
            render json: { status: 'SUCCESS', message: 'Loaded ideas', data: ideas }
          end
    
          def show
            render json: { status: 'SUCCESS', message: 'Loaded the ideas', data: @idea }
          end
    
          def create
            ideas = Idea.new(post_params)
            if Idea.save
              render json: { status: 'SUCCESS', data: idea }
            else
              render json: { status: 'ERROR', data: Idea.errors }
            end
          end
    
          def destroy
            @idea.destroy
            render json: { status: 'SUCCESS', message: 'Deleted the Idea', data: @idea }
          end
    
          def update
            if @idea.update(post_params)
              render json: { status: 'SUCCESS', message: 'Updated the Idea', data: @idea}
            else
              render json: { status: 'SUCCESS', message: 'Not updated', data: @idea.errors }
            end
          end
    
          private
    
          def set_Idea
            @idea = Idea.find(params[:id])
          end
    
          def ideas_params
            params.require(:Idea).permit(:title)
          end
        end
      end
  end
