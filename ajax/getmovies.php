<?php
include_once("../classes/Database.php");
$db = new Database();

/* For getting all the movies */
if (!isset($_GET['id'])){
	if (isset($_GET['title'])){
		$movieinfo = $db->getMoviesByTitleSearch($_GET['title']);
	}else{
		$movieinfo = $db->getAllMoviesByTitle();
	}

	$movieslist = new stdClass();
	$moviearray = array();
	$index = 0;

	foreach ($movieinfo as $movie){
		$moviearray[$index]['movie_id'] = $movie['movie_id'];
		$moviearray[$index]['movie_title'] = $movie['movie_title'];
		$moviearray[$index]['movie_poster'] = $movie['movie_poster'];
		$index++;
	}

	$movieslist->moviearray = $moviearray;
	echo json_encode($movieslist);

/* For getting a single movie */
}else{
	$movieinfo = $db->getAMovie($_GET['id']);
	$movieinfotown = new stdClass();
	
	$directorinfo = $db->getDirector($movieinfo['director_id']);
	$genreinfo = $db->getGenres($movieinfo['genre_id']);
	
	$movieinfotown->movie_title = $movieinfo['movie_title'];
	$movieinfotown->movie_poster = $movieinfo['movie_poster'];
	$movieinfotown->movie_year = $movieinfo['movie_year'];
	$movieinfotown->movie_synopsis = $movieinfo['movie_synopsis'];
	$movieinfotown->movie_director = $directorinfo['director_name'];
	$movieinfotown->movie_genre = $genreinfo['genre_name'];
	
	echo json_encode($movieinfotown);
}