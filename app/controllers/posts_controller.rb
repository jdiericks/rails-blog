class PostsController < ApplicationController
    before_action :find_post, only: [:edit, :update, :show, :delete]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            flash[:notice] = "Successfully created the post!"
            redirect_to post_path(@post)
        else
            flash[:alert] = "There was an error creating the post!"
            render :new
        end
    end
    
    def edit
        
    end
    
    def update
        if @post.update_attributes(post_params)
            flash[:notice] = "Successfully updated the post!"
            redirect_to post_path(@post)
        else
            flash[:alert] = "There was an error in updating the post!"
            render :edit
        end
    end
    
    
    def show
        
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            flash[:notice] = "Successfully deleted the post!"
            redirect_to posts_path
        else
            flash[:alert] = "Error in deleting the post!"
        end
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :body)
    end
    
    def find_post
        @post = Post.find(params[:id])
    end
end
