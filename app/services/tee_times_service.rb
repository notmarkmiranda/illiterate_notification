class TeeTimesService
  def self.call(date:, location:)
    new(date:, location:).call
  end

  def initialize(date:, location:)
    @date = date
    @location = location
  end

  def call
    if location == "Longmont"
      LongmontService.call(date: date)
    end
  end

  private

  attr_reader :date, :location
end