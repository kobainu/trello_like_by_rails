class ApplicationController < ActionController::Base
  # 全てのコントローラーを実行する前にauthenticate_user!を読み込み(authenticate_user! => サインインしていない状態でアクセスしようとすると、サインインページにリダイレクトされます)
  before_action :authenticate_user!
end
