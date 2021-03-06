Rails.application.routes.draw do
  get 'rooms/show'
  get 'messages/index'
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  
  resources :users do
    resources :userfavorites , only: [:index, :create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  
  resources :admins do
    resources :salonfavorites , only: [:index, :create, :destroy]
  end

  resources :admins do
    resources :requests , only: [:index, :destroy, :show, :create] do
      collection do
        get 'new_done', to: 'requests#new_done'
        get 'destroy_done', to: 'requests#destroy_done'
      end
    end
  end

  resources :admins, only: [:show, :edit, :update]
  
  resources :rooms, only: [:index, :show, :create] do
    resources :messages, only: [:create]
  end

  root 'toppages#index'
  
  get 'salontoppage', to: 'salontoppages#index'
  get 'newsalonpage', to: 'newsalonpages#index'
  get 'businesspage', to: 'businesspages#index'
  get 'sportspage',   to: 'sportspages#index'
  get 'skilluppage',  to: 'skilluppages#index'
  get 'foodpage',     to: 'foodpages#index'
  get 'beautypage',   to: 'beautypages#index'
  get 'lovepage',     to: 'lovepages#index'
  get 'sidejobpage',  to: 'sidejobpages#index'
  
  get 'newuserpage',  to: 'newuserpages#index'
  get 'tokyopage',    to: 'tokyopages#index'
  get 'osakapage',    to: 'osakapages#index'
  get 'fukuokapage',  to: 'fukuokapages#index'
  get 'kyotopage',    to: 'kyotopages#index'
  get 'aichipage',    to: 'aichipages#index'
  get 'kanagawapage', to: 'kanagawapages#index'
  get 'chibapage',    to: 'chibapages#index'
  get 'otherpage',    to: 'otherpages#index'
  
end
