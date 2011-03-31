Refinery::Application.routes.draw do
  resources :ministries, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :ministries, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
