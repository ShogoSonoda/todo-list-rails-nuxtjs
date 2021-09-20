module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.all
      end

      def create
        post = Post.new(content: params[:post][:content])
        if post.save
          render json: '作成に成功しました', status: 200
        else
          render json: '作成に失敗しました', status: 500
        end
      end

      def show
        @post = Post.find_by(id: params[:id])
        unless @post
          render json: @post, status: 500
        end
      end

      def update
        post = Post.find_by(id: params[:id])
        if post.update(content: params[:post][:content])
          render json: '更新に成功しました。', status: 200
        else
          render json: '更新に失敗しました。', status: 500
        end
      end
    end
  end
end
