Rails.application.routes.draw do
  post 'login/', to: 'application#legion', as: 'login'
  post 'poliza/', to: 'pacientes#get_pacientes_poliza', as: 'poliza_paciente'
  resources :permisos_doctores
  resources :pacientes
  # resources :horas
  resources :especialidades, :only => [:index]
  # resources :doctores_horas
  resources :doctores
  resources :centros_medicos, :only => [:show, :index]
  resources :citas
  resources :administrativos
  #resources :administradores, :only =>[:show]
  # resources :centros_especialidades
  post '/searchpatient', to: 'pacientes#searchorcreate'
  post '/citas/cancelar', to: 'citas#cancel'
  post '/citas/buscar', to: 'citas#search'
  post '/citas/confirmar', to: 'citas#confirm'
  post '/citas/buscar_doctor', to: 'citas#show_doctor'
  post '/sessions' => 'sessions#create'
  post '/sessions/:id' => 'sessions#destroy'
  post '/sessionadmin', to: 'sessions#create_admin'
  #get citas por centros_medico
  get '/doctorescentro/:id_centro', to: 'doctores#showoncentro'
  get '/administradores/:id/:idu', to: 'administradores#show'
  get '/citas_medicas/:id', to: 'centros_medicos#citascentros'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
