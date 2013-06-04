class DownloadsController < ApplicationController
  def subject
    puts "Called subject with #{params[:download_code]}"
    @subject = Subject.where(:download_code => params[:download_code]).first

    puts "Subject...#{@subject}"

    respond_to do |format|
      format.json { render json: @subject }
    end
  end
  
  def topic
    puts "Called subject with #{:download_code}"
  end
end
