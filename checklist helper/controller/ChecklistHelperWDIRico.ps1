Param (
	[string]$ExecutableSended, 
	[string]$TeamSended
)
$regKeyPath = "Registry::HKEY_CURRENT_USER\Your\Path"
$watchDogPath = ".\executables\$ExecutableSended"
$sleepTimer = 30
$enableWindow = "1"
$disableWindow = "0"

function clean($team, $value) {
    foreach ( $service in $team )
		{
		Set-Itemproperty -Path $regKeyPath -Name $service -Value $value
		}
}

function initialize($team, $value) {
    foreach ( $service in $team )
		{
		Set-Itemproperty -Path $regKeyPath -Name $service -Value $value
		}
}

function open($initials, $team){
	initialize $team $enableWindow 
    & $watchDogPath
    Write-Host("Inicializando o WDI_Rico de", $initials)
    Start-Sleep -Seconds $sleepTimer
    initialize $team $disableWindow 
}

function run(){
	if ($TeamSended -eq "ROT") {
		$sleepTimer = 30
		open "ROT" $itensRoteamento
	}
	elseif ($TeamSended -eq "MD") {
		$sleepTimer = 30
		open "MD" $itensMarketData
	}
	elseif ($TeamSended -eq "SI") {
		$sleepTimer = 30
		open "SI" $itensSI
	}
	elseif ($TeamSended -eq "ALL") {
		$sleepTimer = 30
		open "ROT" $itensRoteamento
		open "SI" $itensSI
		open "MD" $itensMarketData
	}
	elseif ($TeamSended -eq "CLEAN") {
		$sleepTimer = 5
		clean $itensSI $disableWindow
		clean $itensMarketData $disableWindow
		clean $itensRoteamento $disableWindow
		& $watchDogPath
	}
}

$itensSI = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

$itensMarketData = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

$itensRoteamento = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

run