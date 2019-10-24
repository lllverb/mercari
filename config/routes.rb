Rails.application.routes.draw do
devise_for :users,
  controllers: {
  registrations: 'users/registrations' ,
  omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  resources :users do
    collection do
      get 'logout'
      get 'profile'
      get 'phone_number'
      get 'mail_password'
      get 'personal_information'
      get 'credit'
      get 'newuser3'
      get 'credit_create'
      get 'exhibiting'
      get 'trading'
      get 'sold'
      get 'bought'
      get 'ago'
    end
  end
  root 'products#index'
  resources :products do
    collection do
      post 'pay/:id' => 'products#pay', as: 'pay'
      get 'category_children', defaults: {format:'json'}
      get 'category_grandchildren', defaults: {format:'json'}
    end
    member do
      get 'confirmation'
      get 'complete'
      get 'mine'
    end
  end

  
end
