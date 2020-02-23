Rails.application.routes.draw do
  root 'videos#top'
  get 'videos/search'
  post 'videos/watched'
  get "videos/:videoId" => 'videos#show', param: :videoId
end
