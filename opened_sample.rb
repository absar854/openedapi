require 'rest_client'

RestClient.get 'https://api.opened.io/resources.json?descriptive=Fibonacci%20sequence&limit=3'