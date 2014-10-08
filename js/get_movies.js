var httpthang;

function GetXmlHttpObject(){
	var httpthang = null;
	try{
		httpthang = new XMLHttpRequest();
	}catch(e){
		try{
			httpthang = new ActiveXObject("Msxml2.XMLHTTP");
		}catch(e){
			httpthang = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	return httpthang;
}

window.onload = moviesList();

function moviesList(){
	httpthang = GetXmlHttpObject();
		if (httpthang == null){
			alert("You are using a herpderp browser.");
			return;
		}
	var url = "ajax/getmovies.php";
	httpthang.onreadystatechange = getMovieList;
	httpthang.open("GET", url, true);
	httpthang.send(null);
}

function showMovies(title){
	var title = title || "";
	httpthang = GetXmlHttpObject();
		if (httpthang == null){
			alert("You are using a herpderp browser.");
			return;
		}
	var url = "ajax/getmovies.php?title=" + "&title=" + title;
	httpthang.onreadystatechange = function(){getMovieList()};
	httpthang.open("GET", url, true);
	httpthang.send(null);
}

function getMovieList(){
	if (httpthang.readyState == 4 || httpthang.readyState == "complete"){
		var db_movie_info = JSON.parse(httpthang.responseText);
		
		document.getElementById("list_area_movie").innerHTML = "<ul data-role='listview' class='ui-listview'>";
		
		for (var i = 0; i < (db_movie_info.moviearray.length - 1); i++){		
			document.getElementById("list_area_movie").innerHTML += "<li data-corners='false' data-shadow='false' data-iconshadow='true' data-wrapperels='div' data-icon='arrow-r' data-iconpos='right' data-theme='c' class='ui-btn ui-btn-up-c ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-thumb ui-first-child ui-last-child'><div class='ui-btn-inner ui-li'><div class='ui-btn-text'><a href='#movie_details' class='ui-link-inherit' data-rel='page' data-transition='slide' onclick='getMovieDetails(" + db_movie_info.moviearray[i].movie_id + ")'><img src='./" + db_movie_info.moviearray[i].movie_poster + "' alt='" + db_movie_info.moviearray[i].movie_title + "' class='ui-li-thumb'><h3 class='ui-li-heading'>" + db_movie_info.moviearray[i].movie_title + "</h3></a></div><span class='ui-icon ui-icon-arrow-r ui-icon-shadow'>&nbsp;</span></div></li>";
		}
		
		document.getElementById("list_area_movie").innerHTML += "</ul>";
	}
}

function getMovieDetails(movie_id){
	httpthang = GetXmlHttpObject();
		if (httpthang == null){
			alert("You are using a herpderp browser.");
			return;
		}
	var url = "ajax/getmovies.php?id=" + movie_id;
	httpthang.onreadystatechange = showMovieDetails;
	httpthang.open("GET", url, true);
	httpthang.send(null);
}

function showMovieDetails(){
	if (httpthang.readyState == 4 || httpthang.readyState == "complete"){
		var movie_info = JSON.parse(httpthang.responseText);
	}
	
	document.getElementById("movie_info_area").innerHTML = "<img src='./" + movie_info.movie_poster + "' alt='" + movie_info.movie_title + "' style='margin-right:10px;max-height:200px;'><br /><h1 style='margin-bottom:0px;'>" + movie_info.movie_title + "</h1> <b>Year:</b> " + movie_info.movie_year + "<br /><b>Directed by:</b> " + movie_info.movie_director + "<br /><b>Genre:</b> " + movie_info.movie_genre;
	document.getElementById("movie_info_area").innerHTML += "<p>" + movie_info.movie_synopsis + "</p>";
}