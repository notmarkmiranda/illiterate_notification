require "faraday"

class LongmontService
  def self.call(date:)
    new(date: date).call
  end

  def initialize(date:)
    @date = date
  end

  def call
    # Ute Creek
    { ute_creek: fetch_ute_creek }
    # Sunset
    # Twin Peaks
  end

  private

  attr_reader :date

  def fetch_ute_creek
    response = conn.get do |req|
      req.url '/v2/tee-times', date: date, facilityIds: '1801'
      req.headers['authority'] = 'phx-api-be-east-1b.kenna.io'
      req.headers['accept'] = 'application/json, text/plain, */*'
      req.headers['accept-language'] = 'en-US,en;q=0.9'
      req.headers['dnt'] = '1'
      req.headers['if-none-match'] = 'W/"474-Mx/5KTn7veOx7qpEW5Cpc1L3w6E"'
      req.headers['origin'] = 'https://ute-creek-golf-course.book.teeitup.com'
      req.headers['referer'] = 'https://ute-creek-golf-course.book.teeitup.com/'
      req.headers['sec-ch-ua'] = '"Chromium";v="115", "Not/A)Brand";v="99"'
      req.headers['sec-ch-ua-mobile'] = '?0'
      req.headers['sec-ch-ua-platform'] = '"macOS"'
      req.headers['sec-fetch-dest'] = 'empty'
      req.headers['sec-fetch-mode'] = 'cors'
      req.headers['sec-fetch-site'] = 'cross-site'
      req.headers['user-agent'] = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/115.0.0.0 Safari/537.36'
      req.headers['x-be-alias'] = 'ute-creek-golf-course'
    end

    response = JSON.parse(response.body, object_class: OpenStruct)[0]
    x = response.teetimes.map do |tt|
      LongmontTeeTime.new(tt)
    end
  end

  def conn
    @conn ||= Faraday.new(url: 'https://phx-api-be-east-1b.kenna.io') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
end