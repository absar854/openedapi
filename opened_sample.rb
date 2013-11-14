require 'rest_client'

r=RestClient.get 'https://api.opened.io/resources.json?descriptive=Fibonacci%20sequence&limit=3'

puts r["meta"]
