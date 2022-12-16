Rails.application.routes.draw do
  devise_for :users
  root "top#index"

  resources :list, only: %i(new create edit update destroy)
  # onlyを使うと、自動で生成される7つのアクションのうちどのアクションのルーティングを追加するか絞り込むことができます
end
