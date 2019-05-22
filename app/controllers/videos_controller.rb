class VideosController < ApplicationController
  def index
    @videos = ZYPE_CLIENT.videos
  end

  def show
    @video = ZYPE_CLIENT.get_video(params[:id])
  end
end
