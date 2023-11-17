# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
require 'net/http'
require 'json'

puts 'Destroying existing data...'
Movie.destroy_all  # Remplacez YourModel par le nom de votre modèle, par exemple User, Article, etc.
puts 'Existing data destroyed!'

puts 'Destroying existing data...'
List.destroy_all  # Remplacez YourModel par le nom de votre modèle, par exemple User, Article, etc.
puts 'Existing data destroyed!'


url = URI("https://tmdb.lewagon.com/movie/top_rated")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = (url.scheme == 'https')

request = Net::HTTP::Get.new(url)
response = http.request(request)

  data = JSON.parse(response.body)
  data["results"].each do |result|
    url = "https://image.tmdb.org/t/p/original/#{result["poster_path"]}"
    Movie.create(title: result["title"], overview: result["overview"], rating: result["vote_average"], poster_url: url)
    puts "#{result["title"]} created"
  end
puts ""
puts "Movie list created"
puts ""
