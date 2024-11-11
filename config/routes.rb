Rails.application.routes.draw do
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end
  resources :subjects
  root to: 'subjects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sections, only: [:index, :create, :destroy]

  get '/download_pdf', to: 'sections#download_pdf', as: 'download_pdf'
end
