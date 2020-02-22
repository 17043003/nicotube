require 'json'
require 'net/https'
require "uri"

class VideosController < ApplicationController
  def top
  end

  def search
    p params[:word]
    p params[:type]
  end

  def show
  end
end
