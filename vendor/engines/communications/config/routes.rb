Refinery::Application.routes.draw do
  resources :communications, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :communications, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
