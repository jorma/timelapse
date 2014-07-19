<?php

date_default_timezone_set('Pacific/Honolulu');
$today = date("Y_m_d",mktime(0,0,0,date("m") ,date("d"),date("Y")));

// ##########  rename denali ##########

$filedate_denali = "denali_" . $today . ".mp4";

$old_file_denali = "/Users/jorma/dev/timelapse/camData/denali/temp_movie/denali_movie.mp4";
$new_file_denali = "/Users/jorma/dev/timelapse/camData/denali/temp_movie/$filedate_denali";

rename($old_file_denali,$new_file_denali);

copy("/Users/jorma/dev/timelapse/camData/denali/temp_movie/$filedate_denali","/Users/jorma/dev/timelapse/camData/denali/archives/movies/$filedate_denali");

?>