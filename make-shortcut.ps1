param([string]$Browser,[string]$Dest)
$ws = New-Object -ComObject WScript.Shell
$url = ([System.Uri](Join-Path $Dest "index.html")).AbsoluteUri
$args1 = "--app=$url --user-data-dir=`"$Dest\profile`" --no-first-run --no-default-browser-check"
$folders = @([Environment]::GetFolderPath("Desktop"), [Environment]::GetFolderPath("Programs"))
foreach ($f in $folders) {
  $lnk = $ws.CreateShortcut((Join-Path $f "German PDF Reader.lnk"))
  $lnk.TargetPath = $Browser
  $lnk.Arguments = $args1
  $lnk.IconLocation = (Join-Path $Dest "german-flag.ico")
  $lnk.WorkingDirectory = $Dest
  $lnk.Description = "German PDF Reader"
  $lnk.Save()
}
