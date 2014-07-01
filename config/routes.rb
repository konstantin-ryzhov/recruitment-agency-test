Rails.application.routes.draw do

  root 'employees#index'

  resources :skills, only: [:index, :create, :destroy] do
    get :autocomplete_skill_name, :on => :collection
  end

  concern :with_skills do
    resources :skills, only: [:index, :create, :destroy]
  end

  resources :employees, concerns: :with_skills
  resources :vacancies, concerns: :with_skills
end
