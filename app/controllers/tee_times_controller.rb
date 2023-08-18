class TeeTimesController < ApplicationController
  def index
    @courses = TeeTimesService.call(date: params[:date], location: params[:location])
    @date = params[:date]
  end
end