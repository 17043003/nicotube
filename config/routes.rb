Rails.application.routes.draw do
  root 'videos#top'
  get 'videos/search'
  get "videos/:videoId" => 'videos#show', param: :videoId
end
