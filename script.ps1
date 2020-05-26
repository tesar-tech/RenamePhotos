# originaly taken from https://www.tabsoverspaces.com/233463-renaming-files-based-on-exif-data-in-powershell/
function GimE([string]$file)
{
	[Reflection.Assembly]::LoadFile('C:\Windows\Microsoft.NET\Framework64\v4.0.30319\System.Drawing.dll') | Out-Null
	$image = New-Object System.Drawing.Bitmap -ArgumentList $file
	
		try {
			$takenData = $image.GetPropertyItem(36867).Value
		}
		catch {
			$takenData = $null
		}
		if ($null -eq $takenData) {
			return $null
		}
	try {
		$takenValue = [System.Text.Encoding]::Default.GetString($takenData, 0, $takenData.Length - 1)
		$taken = [DateTime]::ParseExact($takenValue, 'yyyy:MM:dd HH:mm:ss', $null)
		return $taken
	}
	finally {
		$image.Dispose()
	}
}

Get-ChildItem @('*.jpg') | ForEach-Object {
	Write-Host "$_`t->`t" -ForegroundColor Cyan -NoNewLine 
	$date = GimE($_.FullName)
	if ($date -eq $null) {
		Write-Host '{ No ''Date Taken'' in Exif }' -ForegroundColor Cyan	
		return
	}
	$newName = $date.ToString('yyyyMMdd_HHmmss') + '.jpg'
	$newName = (Join-Path $_.DirectoryName $newName)
	Write-Host $newName -ForegroundColor Cyan
	Move-Item $_ $newName
}

