## Global variables
$Containers = @('container-1','container-2')
$Images = @('image-1','image-2')
$Volumes = @('volume-1','volume-2')
$Browser = "chrome"
$Url = "http://localhost:300"

## Image, volume and container verifications to clean
$Containers.GetType() | Format-Table -AutoSize
foreach ($ContainerName in $Containers) 
{
    $ContainerId = docker ps -a -q  -f "name=$ContainerName"
    if ($ContainerId -ne $null) {
        Write-Host "-> DELETING $ContainerId - $ContainerName"
        docker container rm -f $ContainerId
    }
}
$Volumes.GetType() | Format-Table -AutoSize
foreach ($VolumeName in $Volumes) 
{
    $VolumeId = $VolumeName
    if ($VolumeId -ne $null) {
        Write-Host "-> DELETING $VolumeId - $VolumeName"
        docker volume rm -f $VolumeId
    }
}
$Images.GetType() | Format-Table -AutoSize
foreach ($ImageName in $Images) 
{
    $ImageId = docker images -q $ImageName
    if ($ImageId -ne $null){
        Write-Host "-> DELETING $ImageId - $ImageName"
        docker image rm -f $ImageId
    }
}

## Start Browser
Start-Sleep -s 3
[system.Diagnostics.Process]::Start($Browser,$Url)

## Docker comands
docker-compose -f docker-support/docker-compose.yml up
