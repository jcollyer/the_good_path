class Api::PostsController < ApplicationController

  def index
    posts = Post.all
    render :json => Api::PostsPresenter.new(posts)
  end

  def show
    post = Post.find(params[:id])
    render :json => Api::PostPresenter.new(post)
  end

  def create
    post = Post.create! do |instance|
      instance.title = params[:post][:title]
      instance.summary = params[:post][:summary]
      instance.context = params[:post][:context]
      instance.image = params[:post][:image]
    end
    render :json => Api::PostPresenter.new(post), :status => :created
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:post][:title]
    post.summary = params[:post][:summary]
    post.context = params[:post][:context]
    post.image = params[:post][:image] if params[:post][:image].present?
    post.save!
    render :json => Api::PostPresenter.new(post), :status => :accepted
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    render :nothing => true, :status => :accepted
  end
end
