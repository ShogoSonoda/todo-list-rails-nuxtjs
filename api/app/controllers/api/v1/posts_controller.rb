module Api
  module V1
    class PostsController < ApplicationController
      def index
        @posts = Post.all
      end
    end
  end
end
