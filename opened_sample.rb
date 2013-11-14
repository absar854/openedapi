require 'rest_client'
require 'json'

phrase="Fibonacci%20sequence"
limit=10
response=RestClient.get 'https://api.opened.io/resources.json?descriptive=#{phrase}&limit=#{limit}'
result=JSON.parse(result)

p "Resources return\n=============="
resources=result["resources"]
resources.each do |r|
  p "Resource: #{r['title']}: #{r['share_url']}"
end

