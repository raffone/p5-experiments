<?php
class WebHole_Youtube_Feed{

	function __construct($username)
	{
		$this->username=$username;
		$this->feedUrl=$url='http://gdata.youtube.com/feeds/api/users/'.$this->username.'/uploads';
		$this->feed=simplexml_load_file($url);
	}

	public function showFullFeed()
	{
		foreach($this->feed->entry as $video){
			echo "<a href='{$video->link['href']}'>".$video->title.'</a><br />';
		}
	}
	public function showTheFirst($limit)
	{
		$i=0;
		while(($video=$this->feed->entry[$i]) && ($i++!=$limit)){
			echo "<a href='{$video->link['href']}'>".$video->title.'</a><br />';
		}

	}
};

$youtube=new WebHole_Youtube_Feed('SpeedDemosArchiveSDA');

// will show the last 5 videos you uploaded
$youtube->showTheFirst(500);
