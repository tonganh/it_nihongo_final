class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :require_user, only: [:edit, :update]
    before_action :require_same_user, only: [:edit, :update, :destroy]
  
    def show
      @articles = @user.articles.paginate(page: params[:page], per_page: 5)
    end
  
    def index
      @users = User.paginate(page: params[:page], per_page: 5)
    end
  end  