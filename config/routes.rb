Rails.application.routes.draw do

  root 'employees#index'

  resources :skills, only: [:index, :create, :destroy]

  concern :with_skills do
    resources :skills, only: [:create, :destroy]
  end

  resources :employees, concerns: :with_skills
  resources :vacancies, concerns: :with_skills
end
