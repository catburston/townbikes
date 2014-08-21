Geocoder.configure(

  # geocoding service:
  :lookup => :google,

  # # IP address geocoding service
  # :ip_lookup => :maxmind,

  # to use an API key:
  # :api_key => ENV['GOOGLE_GEOCODE_API_KEY'], # not working

  # geocoding service request timeout, in seconds (default 3):
  :timeout => 5,

  # set default units to kilometers:
  :units => :km,

  # language is english
  :language => :en,

  # user https for lookup requests
  :use_https    => true,

  # use KM
  :units     => :km,

  # use spherical distances
  :distances => :spherical,

  # # caching (see below for details):
  # :cache => Redis.new,
  # :cache_prefix => "..."

)
