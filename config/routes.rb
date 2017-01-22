Rails.application.routes.draw do
  post 'login/', to: 'application#legion', as: 'login'
  resources :permisos_doctores
  resources :pacientes
  # resources :horas
  resources :especialidades, :only => [:index]
  # resources :doctores_horas
  resources :doctores
  resources :centros_medicos, :only => [:show, :index]
  resources :citas
  resources :administrativos
  # resources :centros_especialidades
  post '/citas/cancelar', to: 'citas#cancel'
  post '/citas/buscar', to: 'citas#search'
  post '/citas/confirmar', to: 'citas#confirm'
  post '/citas/buscar_doctor', to: 'citas#show_doctor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
