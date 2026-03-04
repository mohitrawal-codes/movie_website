-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2026 at 07:35 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `year` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(455) DEFAULT NULL,
  `genre` varchar(100) DEFAULT 'Drama',
  `rating` decimal(3,1) DEFAULT 8.5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `year`, `description`, `poster_url`, `video_url`, `genre`, `rating`) VALUES
(1, 'Night of the Living Dead', 1968, 'A ragtag group of strangers barricade themselves in a rural farmhouse as mysterious radiation turns the dead into flesh-eating ghouls. George A. Romero\'s revolutionary 1968 horror masterpiece that created the modern zombie genre.', '../images/night_of_the_living_dead.jpg', 'https://archive.org/download/night-of-the-living-dead_1968/Night%20of%20the%20Living%20Dead%20-%20%281968%29.mp4', 'Horror', 8.7),
(2, 'The Kid', 1921, 'Charlie Chaplin\'s first full-length feature film follows The Tramp who finds an abandoned baby and raises him amidst hilarious misadventures and heartfelt moments. Silent cinema\'s perfect blend of comedy and pathos.', '../images/the_kid.jpg', 'https://archive.org/download/the-kid-1921-directed-by-charlie-chaplin/The%20Kid%20%281921%29%20Directed%20by%20Charlie%20Chaplin.mp4\"', 'Comedy', 8.4),
(3, 'Sherlock Holmes', 1916, 'William Gillette stars as the famous detective solving a disappearance case in this rare 1916 silent adaptation.', '../images/sherlock_holmes.jpg', 'https://archive.org/download/sherlock-holmes-1916/Sherlock%20Holmes%20%281916%29%20Arthur%20Berthelet%2C%20William%20Gillette.mp4', 'Mystery', 7.9),
(4, 'His Girl Friday', 1940, 'Cary Grant as fast-talking editor Walter Burns desperately schemes to prevent ace reporter Hildy Johnson (Rosalind Russell) from marrying a straight-laced insurance man. Screwball comedy perfection!', '../images/his_girl_friday.jpg', 'https://archive.org/download/his-girl-friday-full-movie-720p-720-x-968.mp-4-converted/His%20Girl%20Friday%20-%20Full%20Movie%20720p%20720%20X%20968.mp4_converted.mp4', 'Comedy', 8.8),
(5, 'The General', 1926, 'Buster Keaton\'s silent comedy masterpiece! Train engineer Johnnie Gray loses his sweetheart, his job, and his train—then joins the Confederacy to win them all back in spectacular Civil War action sequences.', '../images/the_general.jpg', 'https://archive.org/download/the-general-keaton-and-bruckman-1926-high-quality-1080p-t-o-p-swu-fc/The_General_Keaton_and_Bruckman_1926_High_Quality_1080p-T_O-pSwu-fc.ia.mp4', 'Comedy', 8.9),
(6, 'Plan 9 from Outer Space', 1959, 'Ed Wood\'s infamous \"Plan 9 from Outer Space\" features aliens resurrecting the dead to stop humanity\'s space program. Vampires in capes, hubcap UFOs, and Bela Lugosi\'s final role—cinema\'s worst \"best\" film!', '../images/plan_9_from_outer_space.jpg', 'https://archive.org/download/plan-94-k/Plan94K.ia.mp4', 'Sci-Fi', 4.2),
(7, 'The Little Princess', 1939, 'Shirley Temple shines as Sara Crewe, a wealthy boarding school girl who loses everything when her father disappears. Her kindness transforms the harsh headmistress in this beloved tearjerker.', '../images/the_little_princess.jpg', 'https://archive.org/download/the-little-princess-4-k/TheLittlePrincess4K.ia.mp4', 'Drama', 7.8),
(8, 'The Phantom of the Opera', 1925, 'Lon Chaney Sr., the Man of a Thousand Faces, delivers his most iconic performance as Erik, the hideously disfigured musical genius who haunts the Paris Opera House and becomes obsessed with young soprano Christine Daaé.', '../images/the_phantom_of_the_opera.jpg', 'https://archive.org/download/the-phantom-of-the-opera-1925_202505/The%20Phantom%20of%20the%20Opera%20%281925%29.mp4', 'Horror', 8.6),
(9, 'Gulliver’s Travels', 1939, 'First feature-length color cartoon from Fleischer Studios! Gulliver washes ashore in Lilliput where 6-inch-tall people embroil him in their political intrigues and tiny romances.', '../images/Gulliver’s_Travels.jpg', 'https://archive.org/download/GulliversTravels1939_201707/Gulliver%27s%20Travels%20%281939%29.mp4', 'Drama', 8.5),
(10, 'The Stranger', 1946, 'Orson Welles\' directorial debut—a Nazi war criminal hides as a New England schoolteacher in this tense post-war thriller.', '../images/the_stranger.jpg', 'https://archive.org/download/the-stranger-1946-orson-welles-film-noir-crime-mystery-full-length-movie/The%20Stranger%20%281946%29%C2%A0Orson%20Welles%20_%20Film-Noir%2C%20Crime%2C%C2%A0Mystery%20_%20Full%20Length%20Movie.mp4', 'Thriller', 7.9),
(11, 'The Last Time I Saw Paris', 1954, 'Elizabeth Taylor shines in post-WWII Paris romance complicated by war memories and family secrets.', '../images/the_last_time_i_saw_paris.jpg', 'https://archive.org/download/the-last-time-i-saw-paris-1954-elizabeth-taylor-drama-romance-full/Y2Mate.is%20-%20The%20Last%20Time%20I%20Saw%20Paris%20%281954%29%20Elizabeth%20Taylor%20%20Drama%2C%20Romance%20%20Full%20Length%20Movie-7GGqFReLGXI-1080p-1654715077741.mp4', 'Drama', 6.8),
(12, 'The Snows of Kilimanjaro', 1952, 'Gregory Peck searches for meaning on safari while reflecting on lost loves and life choices in Hemingway\'s epic African tale.', '../images/the_snows_of_kilimanjaro.jpg', 'https://archive.org/download/the-snow-in-kali-4-k/TheSnowInKali4K.ia.mp4', 'Drama', 7.3),
(13, 'The Scarlet Letter', 1934, 'Pre-Code adaptation of Hawthorne\'s novel about Puritan adultery and punishment starring silent star Colleen Moore.', '../images/the_scarlet_letter.jpg', 'https://archive.org/download/the-scarlet-letter-1934/The%20Scarlet%20Letter%20%281934%29.mp4', 'Drama', 6.5),
(14, 'The House on Haunted Hill', 1959, 'Vincent Price hosts five strangers invited to spend the night in a creepy mansion with a cash prize. As the clock strikes midnight, murder and mayhem unfold in William Castle\'s classic haunted house thriller.', '../images/the_house_on_haunted_hill.jpg', 'https://archive.org/serve/HouseOnHauntedHill1959/House-On-Haunted-Hill_512kb.mp4', 'Drama', 7.7),
(15, 'The Amazing Mr. X', 1948, 'A beautiful widow tormented by her late husband\'s sinister spiritualist (Turhan Bey) uses ghostly powers to trap her new fiancé in this atmospheric film noir horror.', '../images/the_amazing_mr_x.jpg', 'https://archive.org/serve/the.-amazing.-mr..-x.-1948/The%20Amazing%20Mr.%20X%20%281948%29%2Fmp4%2FThe.Amazing.Mr..X.1948.mp4', 'Horror', 6.4),
(16, 'The Big Lift', 1950, 'Post-WWII drama about American airmen divided by their experiences during the Berlin Airlift.', '../images/the_big_lift.jpg', 'https://archive.org/serve/TheBigLift1950complete/TheBigLift1950_512kb.mp4', 'Drama', 6.9),
(17, 'The Fat Man', 1951, 'Rock Hudson as a detective tracking blackmailers in this film noir based on a popular radio series.', '../images/the_fat_man.jpg', 'https://archive.org/serve/thefatman1951_202002/The%20Fat%20Man%20%281951%2C%20USA%29%20Featuring%20Rock%20Hudson%2C%20Julie%20London%20-%20Film%20Noir%20Full%20Movie.mp4', 'Crime', 6.6),
(18, 'The Terror', 1963, 'Young Lt. Gerald (Jack Nicholson) searches a deserted castle for his missing wife while encountering ghostly apparitions and eerie doppelgängers in Roger Corman\'s gothic horror.', '../images/the_terror.jpg', 'https://archive.org/download/PhantasmagoriaTheater-TheTerror1963627/PhantasmagoriaTheater-TheTerror1963627_512kb.mp4', 'Horror', 5.8),
(19, 'The Man with the Golden Arm', 1955, 'Frank Sinatra\'s harrowing performance as a heroin-addicted card dealer desperate to escape his habit.', '../images/the_man_with_the_golden_arm.jpg', 'https://archive.org/serve/TheManWithTheGoldenArm1955/The%20Man%20with%20the%20Golden%20Arm%20%281955%29.mp4', 'Drama', 7.5),
(20, 'The Great Train Robbery', 1903, 'Edwin S. Porter\'s pioneering 1903 silent western—one of the first narrative films ever made.', '../images/the_great_train_robbery.jpg', 'https:/archive.org/download/TheGreatTrainRobbery_555/TheGreatTrainRobbery_512kb.mp4', 'Western', 7.2),
(21, 'Made For Each Other', 1939, 'James Stewart and Carole Lombard as a young couple facing career pressures, illness, and the fight to save their critically ill infant in this touching 1939 family drama.', '../images/made_for_each_other.jpg', 'https:/archive.org/download/made-for-each-other-4-k/MadeForEachOther4K.ia.mp4\"', 'Romance', 7.1),
(22, 'Penny Serenade', 1941, 'Cary Grant and Irene Dunne as a childless couple whose lives change forever through adoption and personal tragedy in this Oscar-nominated romantic drama.', '../images/penny_serenade.jpg', 'https:/archive.org/download/penny-serenade-1941/Penny%20Serenade%20%281941%29.mp4\"', 'Romance', 7.4),
(23, 'Love Affair', 1939, 'Charles Boyer and Irene Dunne meet on an ocean liner and plan to reunite atop the Empire State Building six months later. Fate intervenes in this romantic classic.', '../images/love_affair.jpg', 'https:/archive.org/serve/love-affair-4-k/LoveAffair4K.ia.mp4\"', 'Romance', 7.9),
(24, 'Bird of Paradise', 1932, 'Joel McCrea romances Polynesian princess Dolores del Río in this exotic pre-Code South Seas adventure filmed on location with spectacular underwater photography.', '../images/bird_of_Paradise.jpg', 'https:/archive.org/download/bird-of-paradise-1932/Bird%20of%20Paradise%20%281932%29.ia.mp4\"', 'Romance', 6.7),
(25, 'A Star Is Born', 1937, 'Janet Gaynor won an Oscar as Esther Blodgett, whose Hollywood rise destroys her marriage to alcoholic star Norman Maine (Fredric March) in this original Hollywood tragedy.', '../images/a_star_is_born.jpg', 'https:/archive.org/download/batvwi-A_Star_Is_Born_1937/A_Star_Is_Born_1937.mp4\"', 'Romance', 8.1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
