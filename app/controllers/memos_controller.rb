class MemosController < ApplicationController

  def index
    @memos = Memo.all
  end

  def new
    @memo = Memo.new
  end

  def create
    Memo.create(memo_params)
  end

  def search
    @memos = Memo.search(params[:keyword])
  end

  private
  def memo_params
    params.require(:memo).permit(:title, :text).merge(user_id: current_user.id)
  end

end
