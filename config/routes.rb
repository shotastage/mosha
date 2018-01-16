Rails.application.routes.draw do

  get 'fileuploads/index'

  post 'fileuploads/create'

  post 'fileuploads/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'emo/get_image', to: 'emo#get_image'


  get 'emo/show'

  get 'emo/capture'

  post 'emo/submit'

  get 'timeline/index'

  get 'timeline/post'

  get 'pages/show'

  root 'pages#index'

  get '/feel/good' => 'emo#add'
  get '/feel/bad' => 'emo#rmove'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

end
