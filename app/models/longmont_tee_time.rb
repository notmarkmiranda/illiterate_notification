class LongmontTeeTime
  attr_reader :time, :spots_available, :min_players, :max_players, :rates
  
  def initialize(object)
    @time = object.teetime.to_datetime.in_time_zone("Mountain Time (US & Canada)")
    @spots_available = object.maxPlayers
    @min_players = object.minPlayers
    @max_players = object.maxPlayers
    @rates = object.rates
  end
end

# {"courseId"=>"54f14bf50c8ad60378b01a90",
#!   "teetime"=>"2023-08-19T19:10:00.000Z",
#   "backNine"=>false,
#   "players"=>[],
# !  "rates"=>
#    [{"_id"=>622453312,
#      "name"=>"18 Free Golf Cart",
#      "externalId"=>"622453312",
#      "allowedPlayers"=>[1],
#      "holes"=>18,
#      "icons"=>[],
#      "tags"=>["TI", "CI"],
#      "golfnow"=>
#       {"TTTeeTimeId"=>622453312, "GolfFacilityId"=>1801, "GolfCourseId"=>143718},
#      "trade"=>false,
#      "dueOnlineRiding"=>0,
#      "greenFeeCart"=>8000,
#      "promotion"=>{"discount"=>0.14, "greenFeeCart"=>6900},
#      "acceptCreditCard"=>false},
#     {"_id"=>622508930,
#      "name"=>"Prepaid - Walking",
#      "externalId"=>"622508930",
#      "allowedPlayers"=>[1],
#      "holes"=>18,
#      "icons"=>[],
#      "tags"=>["WR"],
#      "golfnow"=>
#       {"TTTeeTimeId"=>622508930, "GolfFacilityId"=>1801, "GolfCourseId"=>143717},
#      "trade"=>false,
#      "dueOnlineWalking"=>5100,
#      "greenFeeWalking"=>5400,
#      "promotion"=>{"discount"=>0.06, "greenFeeWalking"=>5100},
#      "acceptCreditCard"=>false}],
#   "bookedPlayers"=>3,
#!   "minPlayers"=>1,
#!   "maxPlayers"=>1,
#   "source"=>"API-2.1",
#   "fromCache"=>false}