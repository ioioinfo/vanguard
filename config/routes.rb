Rails.application.routes.draw do
  
  get 'sessions/new'

  post 'sessions/create'

  get 'applicants/new'

  post 'applicants/create'
  
  get 'applicants/verify'
  
  get 'groups/index'
  
  get 'groups/add'
  
  get 'groups/addnewstaff'
   
  get 'user/index'
  
  post 'user/save'
  
  get 'groups/deletegroup'
  
  get 'sessions/newlogin'
  
  


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
