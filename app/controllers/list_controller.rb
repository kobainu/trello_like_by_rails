class ListController < ApplicationController
  # edit, update, destroyの実行前にset_listメソッドを読み込み
  before_action :set_list, only: %i(edit update destroy)

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render action: :new
    end
  end

  def edit
  end
  
  def update
    if @list.update(list_params)
      redirect_to :root
    else
      render action: :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private
    def list_params
      params.require(:list).permit(:title).merge(user: current_user)
      # requireで受け取る値のキーを設定します
      # permitで変更を加えられるキーを指定します
      # mergeメソッドは2つのハッシュを統合するメソッドです。今回は誰がリストを作成したかという情報が必要なためuserの情報を統合しています
    end

    def set_list
      @list = List.find_by(id: params[:id])
    end
end
