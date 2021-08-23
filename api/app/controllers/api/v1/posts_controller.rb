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
    end
  end
end
