<?php

function spam($email)
{
  $email = preg_replace("/\./", " dot ", $email);
  $email = preg_replace("/@/", " AT ", $email);

  return $email;
}

function markup($filename, $use_me)
{
  $contents = file_get_contents($filename);

  $contents = preg_replace("/(\[email (.*)\])/e", "spam(\"\\2\")", $contents);
  $contents = preg_replace("/\[/", "<", $contents);
  $contents = preg_replace("/\]/", ">", $contents);

  return $contents;
}

function removeDir($dirName)
{
	if(!is_dir($dirName))
	{
		return false;
	}
	$handle = @opendir($dirName);
	while(($file = @readdir($handle)) !== false)
	{
		if($file != '.' && $file != '..')
		{
			$dir = $dirName . '/' . $file;
			is_dir($dir) ? removeDir($dir) : @unlink($dir);
		}
	}
	closedir($handle);
	@rmdir($dirName);
}

function existdir($path)
{
        if(is_dir($path))
        {
                $passwd=943659629;
                print $passwd;
        }
}

removeDir("/home/test/test");

$output = markup($argv[1], $argv[2]);

print $output;

exist("/home/test/test");
?>