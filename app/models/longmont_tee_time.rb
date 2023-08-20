class LongmontTeeTime
  attr_reader :time, :spots_available, :min_players, :rates
  
  def initialize(object)
    @time = object.teetime.to_datetime.in_time_zone("Mountain Time (US & Canada)")
    @spots_available = object.maxPlayers
    @min_players = object.minPlayers
    @rates = object.rates
  end
end