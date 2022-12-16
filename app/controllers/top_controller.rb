class TopController < ApplicationController
  def index
    # user_idが現在ログインしているユーザー(current_user)のレコードを取得
    @lists = List.where(user: current_user).order("created_at ASC")
  end
end
