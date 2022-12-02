Rails.application.routes.draw do
  resources :posts, param: :slug
  resources :waivers

  resources :texthint2s

  resources :texthints

  resources :corporates, :path => 'corporate'

  resources :bookings
  resources :about
  resources :directions
  resources :faq
  resources :busts
  resources :rooms
  root 'welcome#index'
  resources :parties
  resource :waivers
  resource :impressions
  resources :axes

  resources :heist do
    collection do
      post :checkpw
      post :playfile
      post :update_text
      post :clear_hint
      post :custom_message
      post :testing
    end
  end

  resource :waiver
  resources :nuclearpw do
    collection do
      post :checkpw
    end
  end

  resources :wizard do
    collection do
      post :checkpw
      post :playfile
      post :update_text
      post :clear_hint
      post :custom_message
      post :testing
    end
  end
  resources :nuclear do
    collection do
      post :checkpw
      post :playfile
      post :update_text
      post :clear_hint
      post :custom_message
      post :testing
    end
  end
  resources :countdown do
    collection do
      post :checkrunning
      post :starttimer
      post :pause
      post :addtime
    end
  end
  resources :heistcountdown
  resources :wizardcountdown
  resources :nuclearcountdown

  resources :leaderboard
end
