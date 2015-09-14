require 'sinatra'
require 'open-uri'

set :bind, '0.0.0.0'
set :port, 80

get '/prefixes/:as' do 
  doc = open("http://ipinfo.io/#{params['as']}", &:read)
  prefixes = doc.scan(/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{1,3}/).uniq.join(' ')
end
