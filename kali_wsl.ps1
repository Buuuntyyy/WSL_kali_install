#create a Kali-Linux WSL in a second

$version = $wslVersion = wsl --version | Select-String "WSL version" | ForEach-Object { $_.ToString().Split(':')[1].Trim() }
if ($version -ne 2){
    #activation des fonctionnalités de virtualisation
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
    Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
    Restart-Computer -Force

}


#Mise à jour de WSL
wsl --update

#Installation de Kali-linux
wsl --install --distribution kali-linux
