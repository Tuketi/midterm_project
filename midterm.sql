-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 14, 2014 at 06:44 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `midterm`
--
CREATE DATABASE IF NOT EXISTS `midterm` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `midterm`;

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE IF NOT EXISTS `directors` (
  `director_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `director_name` varchar(100) NOT NULL,
  PRIMARY KEY (`director_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`director_id`, `director_name`) VALUES
(1, 'David Fincher'),
(2, 'Henry Alex Rubin'),
(3, 'Tom Ford'),
(4, 'Steve Miner'),
(5, 'Nick Tomnay');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `genre_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `genre_name` varchar(50) NOT NULL,
  PRIMARY KEY (`genre_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(1, 'Drama'),
(2, 'Thriller'),
(3, 'Family');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE IF NOT EXISTS `movies` (
  `movie_id` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `movie_title` varchar(100) NOT NULL,
  `movie_year` year(4) NOT NULL,
  `movie_synopsis` varchar(5000) NOT NULL,
  `movie_poster` varchar(100) NOT NULL,
  `director_id` int(5) unsigned NOT NULL,
  `genre_id` int(5) unsigned NOT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `movie_title`, `movie_year`, `movie_synopsis`, `movie_poster`, `director_id`, `genre_id`) VALUES
(1, 'Fight Club', 1999, 'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.', 'images/fight-club-poster.jpg', 1, 1),
(2, 'Disconnect', 2012, 'A hard-working lawyer, attached to his cell phone, can''t find the time to communicate with his family. A couple is drawn into a dangerous situation when their secrets are exposed online. A widowed ex-cop struggles to raise a mischievous son who cyber-bullies a classmate. An ambitious journalist sees a career-making story in a teen that performs on an adult-only site. They are strangers, neighbors and colleagues and their stories collide in this riveting dramatic thriller about ordinary people struggling to connect in today''s wired world.', 'images/disconnect.png', 2, 2),
(3, 'A Single Man', 2009, 'It''s November 30, 1962. Native Brit George Falconer, an English professor at a Los Angeles area college, is finding it difficult to cope with life. Jim, his personal partner of sixteen years, died in a car accident eight months earlier when he was visiting with family. Jim''s family were not going to tell George of the death or accident, let alone allow him to attend the funeral. This day, George has decided to get his affairs in order before he will commit suicide that evening. As he routinely and fastidiously prepares for the suicide and post suicide, George reminisces about his life with Jim. But George spends this day with various people, who see a man sadder than usual and who affect his own thoughts about what he is going to do. Those people include Carlos, a Spanish immigrant/aspiring actor/gigolo recently arrived in Los Angeles; Charley, his best friend who he knew from England, she who is a drama queen of a woman who romantically desires her best friend despite his sexual orientation; and Kenny Potter, one of his students, who seems to be curious about his professor beyond English class.', 'images/a_single_man.png', 3, 1),
(4, 'Wild Hearts Can''t Be Broken', 1991, 'This is the story of Sonora Webster, a teenage runaway during the Depression. Her life''s ambition is to travel to Atlantic City, where "all your dreams come true." After leaving home she accepts a job from Dr. Carver and his girl-and-horse high diving act. Starting out as a stable hand her goal is to become a real diving girl. Dr. Carver''s son, Al, helps her in her quest by helping her tame a wild horse she''s named Lightning. Their early morning practices lead not only to Sonora being put into training as a diving girl, but also for Al''s emotions for Sonora to begin to surface. Al leaves after an argument with his father and the diver girl, Marie, is injured in a practice. Sonora finally takes her place and becomes a real diving girl. The act is thriving but fairgrounds are suffering hard times and the show is closed. Al comes back with the surprise revelation of getting the act booked in Atlantic City. Dr. Carver passes away en route to New Jersey and Al takes over. He asks Sonora to marry him before her first jump in her dream city. She accepts but then has an accident in the dive that leaves her permanently blind. Al will not let her do the show and brings Marie back to take her place. Sonora does not want to sit on the sidelines anymore and takes matters into her own hands. Practicing all day to finally make it back up the ladder, she has Marie locked in her trailer while she makes the jump to prove to everyone and herself that she can do it and without the audience ever knowing that she is blind.', 'images/wild_hearts.jpg', 4, 3),
(5, 'The Perfect Host', 2010, 'Injured after committing a bank robbery, John Taylor is desperate to find a place to hide out and approaches the home of Warick Wilson. John manages to get himself invited into the house by posing as a friend of a friend and spinning a sob story of lost luggage and a violent mugging. Inside, Warick, a consummate host, is making the final preparations for an impeccable dinner party. He insists John stay for the party, but as the evening begins it becomes obvious Warick may not be what he first appears.', 'images/the_perfect_host.png', 5, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
