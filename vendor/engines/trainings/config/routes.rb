Refinery::Application.routes.draw do
  resources :trainings, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :trainings, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
