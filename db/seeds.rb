require "json"
require "open-uri"

User.create(email: "wagnerp5@hotmail.com", password: "123456")
User.create(email: "joao@hotmail.com", password: "123456")
User.create(email: "anita@hotmail.com", password: "123456")
User.create(email: "bruna@hotmail.com", password: "123456")

def url(input)
url = "http://www.omdbapi.com/?t=#{input}&&apikey=23cddb7e&"
movies_serialized = URI.open(url).read
movie = JSON.parse(movies_serialized)
Movie.create(title: movie["Title"], year: movie["Year"],
             genre: movie["Genre"], plot: movie["Plot"],
             director: movie["Director"], writer: movie["Writer"],
             poster_url: movie["Poster"]
             )
end

url("harry+potter")
url("everything+everywhere+all+at+once")
url("the+perks+of+being+a+wallflower")
url("black+swan")
url("fight+club")
url("la+la+land")

List.create(title: "my fav movies!", user_id: 1)
List.create(title: "directed by women s2", user_id: 1)
List.create(title: "awesome movies", user_id: 2)

Bookmark.create(movie_id: 1 , list_id: 1)
Bookmark.create(movie_id: 2 , list_id: 1)
Bookmark.create(movie_id: 3, list_id: 1)
Bookmark.create(movie_id: 2, list_id: 2)
Bookmark.create(movie_id: 3, list_id: 2 )
Bookmark.create(movie_id: 4, list_id: 2)
Bookmark.create(movie_id: 4, list_id: 3)
Bookmark.create(movie_id: 5 , list_id: 3)
Bookmark.create(movie_id: 6, list_id: 3)
Bookmark.create(movie_id: 1 , list_id: 3)
