Rails.application.routes.draw do
  devise_for :users
  get 'user_root' => 'songs#index', as: :user_root

  HighVoltage.configure do |config|
    config.home_page = 'home'
  end

  resources :songs, except: [:show]
end
