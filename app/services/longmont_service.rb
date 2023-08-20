require "faraday"

class LongmontService
  def self.call(date:)
    new(date: date).call
  end

  def initialize(date:)
    @date = date
  end

  def call
    { 
      ute_creek: fetch_ute_creek,
      twin_peaks: fetch_twin_peaks,
      sunset: fetch_sunset
    }
  end

  private

  attr_reader :date

  def fetch_ute_creek
    response = fetch_times(course_id: '1801', origin: 'https://ute-creek-golf-course.book.teeitup.com', aliasx: 'ute-creek-golf-course')
    create_longmont_tee_times(response)
  end
  
  def fetch_sunset
    response = fetch_times(course_id: '8211', origin: 'https://sunset-golf-course.book.teeitup.com/', aliasx: 'sunset-golf-course')
    create_longmont_tee_times(response)
  end

  def fetch_twin_peaks
    response = fetch_times(course_id: '1830', origin: 'https://twin-peaks-golf-course.book.teeitup.com/', aliasx: 'twin-peaks-golf-course')
    create_longmont_tee_times(response)
  end

  def create_longmont_tee_times(response)
    response = JSON.parse(response.body, object_class: OpenStruct)[0]
    response.teetimes.map do |tt|
      LongmontTeeTime.new(tt)
    end
  end

  def fetch_times(course_id:, origin:, aliasx:)
    conn.get do |req|
      req.url '/v2/tee-times', date: date, facilityIds: course_id
      req.headers['authority'] = 'phx-api-be-east-1b.kenna.io'
      req.headers['accept'] = 'application/json, text/plain, */*'
      req.headers['accept-language'] = 'en-US,en;q=0.9'
      req.headers['dnt'] = '1'
      req.headers['if-none-match'] = 'W/"474-Mx/5KTn7veOx7qpEW5Cpc1L3w6E"'
      req.headers['origin'] = origin
      req.headers['referer'] = origin
      req.headers['sec-ch-ua-mobile'] = '?0'
      req.headers['sec-fetch-dest'] = 'empty'
      req.headers['sec-fetch-mode'] = 'cors'
      req.headers['sec-fetch-site'] = 'cross-site'
      req.headers['x-be-alias'] = aliasx
    end
  end

  def conn
    @conn ||= Faraday.new(url: 'https://phx-api-be-east-1b.kenna.io') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
end