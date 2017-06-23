class CommentsController < ApplicationController
	def index
	@comments = Comment.all
end

def show
	@comment = Comment.find(params[:id])
end

def new
	@comment = Comment.new
end

# CREATE
def create
	@comment = Comment.find(params[:comment_id])
	@comment = @comment.comments.create(comment_params)
	redirect_to comment_path(@comment)
end

# DESTROY
def destroy
	@comment = Comment.find(params[:comment_id])
	@comment = @comment.comments.find(params[:id])

	@comment.destroy
	redirect_to comment_path(@comment)
end

def edit
	@comment = Comment.find(params[:id])
end

def update
	@comment = Comment.find(params[:id])
	if @comment.update_attributes(comment_params)
	redirect_to comments_path
	else
	render :edit
	end
end

private
def comment_params
params.require(:comment).permit(:name, :comment)
end

