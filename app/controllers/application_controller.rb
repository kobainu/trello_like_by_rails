class ApplicationController < ActionController::Base
  # クロスサイトリクエストフォージェリ (CSRF)への対応策のコード
  protect_from_forgery with: :exception
  
  # 全てのコントローラーを実行する前にauthenticate_user!を読み込み(authenticate_user! => サインインしていない状態でアクセスしようとすると、サインインページにリダイレクトされます)
  before_action :authenticate_user!

  # devise_controllerを使うとき(ユーザー登録時、更新時)のみ処理
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    # nameカラムを保存できるようにする
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end
