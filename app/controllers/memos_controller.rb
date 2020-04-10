class MemosController < ApplicationController

  def index
    @memos = Memo.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  def new
    @memo = Memo.new
  end

  def create
    Memo.create(memo_params)
  end

  def show
    @memo = Memo.find(params[:id])
    @comment = Comment.new
    @comments = @memo.comments.includes(:user)
  end

  def edit
    @memo = Memo.find(params[:id])
  end

  def update
    memo = Memo.find(params[:id])
    memo.update(memo_params)
    redirect_to user_path(current_user)
  end

  def destroy
    memo = Memo.find(params[:id])
    memo.destroy
    redirect_to user_path(current_user)
  end

  def search
    @memos = Memo.search(params[:keyword]).includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :text, :complete).merge(user_id: current_user.id)
  end

end
