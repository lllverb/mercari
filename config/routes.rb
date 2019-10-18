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
  root 'products#index'
# user関係
  get 'users/logout'
  get 'users/profile'
  get 'users/phone_number'
  get 'users/mail_password'
  get 'users/personal_information'
  get 'users/credit'
  get 'users/newuser3'
  get 'users/credit_create'
# user関係
  resources :products, only: [:index, :show, :new, :edit, :create] 
  resources :users, only: [:index, :edit, :update]
  
end
