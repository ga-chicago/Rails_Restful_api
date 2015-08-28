Rails.application.routes.draw do

  root 'home#index'

  get 'api/people' => 'people#list'
  get 'api/people/:id' => 'people#read'
  post 'api/people' => 'people#create'
  patch 'api/people/:id' => 'people#update'
  put 'api/people/:id' => 'people#update'
  delete 'api/people/:id' => 'people#destroy'

end
