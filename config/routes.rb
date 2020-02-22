Rails.application.routes.draw do
  root 'videos#top'
  get 'videos/search'
  get "videos/:videoId" => 'videos#show', param: :videoId
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
