<?php
class Database{

	public function __construct(){
		mysql_connect("localhost","root","");
		mysql_select_db("midterm");
	}
	
	public function getAllMoviesByTitle($select = "*"){
		$sel = mysql_real_escape_string($select);
			$query = mysql_query("SELECT ".$sel." FROM movies ORDER BY movie_title");
			while ($results[] = mysql_fetch_array($query));
			return $results;
	}
	
	public function getMoviesByTitleSearch($title, $select = "*"){
		$titlesearch = mysql_real_escape_string($title);
		$sel = mysql_real_escape_string($select);
		$query = mysql_query("SELECT ".$sel." FROM movies WHERE movie_title LIKE '%$titlesearch%' ORDER BY movie_title");
			while ($results[] = mysql_fetch_array($query));
			return $results;
	}
	
	public function getAMovie($movieid, $select = "*"){
		$id = mysql_real_escape_string($movieid);
		$sel = mysql_real_escape_string($select);
			$query = mysql_query("SELECT ".$sel." FROM movies WHERE movie_id = '$id'");
			return mysql_fetch_array($query);
	}
	
	public function getDirector($dirid, $select = "*"){
		$id = mysql_real_escape_string($dirid);
		$sel = mysql_real_escape_string($select);
			$query = mysql_query("SELECT ".$sel." FROM directors WHERE director_id = '$id'");
			return mysql_fetch_array($query);
	}
	
	public function getGenres($genreid){
		$id = mysql_real_escape_string($genreid);
			$query = mysql_query("SELECT genre_name FROM genres WHERE genre_id = '$id'");
			return mysql_fetch_array($query);
	}

}