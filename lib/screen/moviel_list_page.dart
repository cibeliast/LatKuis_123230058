import 'package:flutter/material.dart';
import 'package:latihan_kuis_a/models/movie_model.dart';
import 'package:latihan_kuis_a/screen/movie_detail_page.dart'; 

List<MovieModel> savedMovies = [];

class MovieListPage extends StatefulWidget {
  final String username;

  const MovieListPage({super.key, this.username = "bella"});

  @override
  State<MovieListPage> createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome, ${widget.username}!',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: movieList.length, 
        itemBuilder: (context, index) {
          final movie = movieList[index];
          final isSaved = savedMovies.contains(movie);

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300, width: 1),
              borderRadius: BorderRadius.circular(4.0),
            ),
            elevation: 0,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Poster
                    Container(
                      width: 80,
                      height:
                          110, 
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        image: DecorationImage(
                          image: NetworkImage(
                            movie.imgUrl,
                          ), 
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${movie.title} (${movie.year})',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            movie.genre,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text('${movie.rating}/10'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isSaved ? Icons.bookmark : Icons.bookmark_border,
                        color: isSaved ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isSaved) {
                            savedMovies.remove(movie);
                          } else {
                            savedMovies.add(movie);
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
