Rails.application.routes.draw do
  post 'login/', to: 'application#legion', as: 'login'
  post 'poliza/', to: 'pacientes#get_pacientes_poliza', as: 'poliza_paciente'
  resources :permisos_doctores
  resources :pacientes
  resources :horas
  resources :especialidades
  resources :doctores_horas
  resources :doctores
  resources :centros_medicos
  resources :citas
  resources :administrativos
  resources :centros_especialidades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
