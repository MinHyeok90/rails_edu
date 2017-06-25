class BlogController < ApplicationController
    def index
        @welcome = "안녕하세요"
    end
    
    def list
        @posts = Post.all
    end
    
    
    def write
    end
    
    def create
        title = params[:title].to_s
        contents = params[:contents]
        
        new_post = Post.new
        new_post.title = title
        new_post.contents = contents
        new_post.save!
        redirect_to "/blog/list"
    end
    
    
    def update
        post_id = params[:post_id]
        @one_post = Post.find(post_id)
    end
    
    def real_update
        one_post = Post.find(params[:post_id])
        one_post.title = params[:title]
        one_post.contents = params[:contents]
        one_post.save!
        redirect_to "/blog/list"
    end
    
    def delete
        one_post = Post.find(params[:post_id])
        one_post.destroy!
        redirect_to "/blog/list"
    end
    
    
end
