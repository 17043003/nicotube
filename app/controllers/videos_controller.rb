require 'json'
require 'net/https'
require "uri"

class VideosController < ApplicationController
  def top
  end

  def search
    type = params[:type]
    @nico_end_point = "https://api.search.nicovideo.jp/api/v2/#{type}/contents/search?"

    @word = params[:word] # 検索ワード
    number_of_content = 10 # 取得する動画数
    number_of_offset = 0 # 先頭から何番目の動画から取得するか

    data = {
    "q": @word,
    "targets": "title,description,tags",
    "_sort": "-startTime",
    "fields": "contentId,title,description,tags,thumbnailUrl",
    "_limit": number_of_content,
    "_offset": number_of_offset
    }

    query = data.to_query
    uri = URI(@nico_end_point+query)

    response = Net::HTTP.get_response(uri)
    response_body = JSON.parse(response.read_body)

    if response_body['data'].present?
      @content = response_body['data'].map do |response_data|
        {
          contentId: response_data['contentId'],
          title: response_data['title'],
          thumbnail: response_data['thumbnailUrl']
        }
      end
    else
      flash[:notice] = "動画が見つかりませんでした"
    end
  end

  def watched
    @video = Video.find_by(videoId: params[:videoId])
    if @video
      @video.watched_at = Time.zone.now
      @video.watch_time += 1
    else
      @video = Video.new(video_params)
      @video.watched_at = Time.zone.now
      @video.watch_time = 1
    end

    if @video.save
      redirect_to "/videos/#{@video.videoId}"
    end
  end

  def show
    
  end

  private
  def video_params
    params.permit(:name, :videoId, :watched_at)
  end
end
