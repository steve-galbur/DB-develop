Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'author' => 'author#index'

  # scope :admin do
  #   resources :posts
  # end

  # namespace :admin do
  #   resources :posts, path: 'posts'
  # end

  scope module: "admin" do
    resources :posts
  end

  # namespace :admin, scope: '' do ||
  #   resources :posts
  # end
end
