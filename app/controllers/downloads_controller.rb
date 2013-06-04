class DownloadsController < ApplicationController
  def subject
    @subject = Subject.find_by_download_code(params[:download_code])
    respond_to do |format|
      format.json { render json: @subject }
    end
  end
  
  def topic
    puts "Called subject with #{:download_code}"
    @topic = Topic.find_by_download_code(params[:download_code])
    respond_to do |format|
      format.json { render json: @topic }
    end
  end
end
