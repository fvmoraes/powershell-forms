Param (
	[string]$ExecutableSended, 
	[string]$TeamSended
)
$regKeyPath = "Registry::HKEY_CURRENT_USER\Yor\Path"
$watchDogPath = ".\executables\$ExecutableSended"
$sleepTimer = 90
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
    Write-Host("Inicializando o WDI de", $initials)
    Start-Sleep -Seconds $sleepTimer
    initialize $team $disableWindow 
}

function run(){
	if ($TeamSended -eq "ROT") {
		$sleepTimer = 30
		open "ROT" $itensRoteamento
	}
	elseif ($TeamSended -eq "MD") {
		$sleepTimer = 90
		open "MD-Fronts1" $itensMarketDataFronts1
		open "MD-Fronts2" $itensMarketDataFronts2
		open "MD-Exchanges" $itensMarketDataExchanges
		open "MD-Proxies" $itensMarketDataProxies
	}
	elseif ($TeamSended -eq "SI") {
		$sleepTimer = 30
		open "SI" $itensSI
	}
	elseif ($TeamSended -eq "ALL") {
		$sleepTimer = 90
		open "ROT" $itensRoteamento
		open "SI" $itensSI
		open "MD-Fronts1" $itensMarketDataFronts1
		open "MD-Fronts2" $itensMarketDataFronts2
		open "MD-Exchanges" $itensMarketDataExchanges
		open "MD-Proxies" $itensMarketDataProxies
	}
	elseif ($TeamSended -eq "CLEAN") {
		$sleepTimer = 5
		clean $itensSI $disableWindow
		clean $itensMarketDataFronts1 $disableWindow
		clean $itensMarketDataFronts2 $disableWindow
		clean $itensMarketDataProxies $disableWindow
		clean $itensMarketDataExchanges $disableWindow
		clean $itensRoteamento $disableWindow
		& $watchDogPath
	}
}

$itensSI = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

$itensMarketDataFronts1 = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

$itensMarketDataFronts2 = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

$itensMarketDataExchanges = @(
	'Window 1'
	'Window 2'
	'Window 2'
)

$itensMarketDataProxies = @(
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