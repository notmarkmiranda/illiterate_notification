class TeeTimesController < ApplicationController
  def index
    @teetimes = TeeTimesService.call(date: params[:date], location: params[:location])
    @date = params[:date]
  end
end