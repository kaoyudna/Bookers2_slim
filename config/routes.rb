Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only:[:index, :show, :edit, :update] do
      resource :relationships, only:[:create, :destroy]
      get 'follower' => 'relationships#follower'
      get 'following' => 'relationships#following'
    end
    resources :books, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    get 'search' => 'searches#search'
  end

end
