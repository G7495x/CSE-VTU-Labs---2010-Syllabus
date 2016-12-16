Rails.application.routes.draw do
  	#For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	get "books/index"=>"books#index",:as=>:index
	match "books/add"=>"books#add",:via=>:post
	match "books/search"=>"books#search",:via=>:post
end
