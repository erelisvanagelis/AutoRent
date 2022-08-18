try
{
        Install-Module BcContainerhelper -Force
}
catch 
{

}

Import-Module BCcontainerhelper -Force -Verbose


#Busines Centrall conteinerio kurimas Docker

$containerName = "Auto04"            
        
cd "c:\"
Measure-Command {
    $artifactUrl = Get-BCArtifactUrl -version 20.1 -select Latest -country w1 OnPrem
    $credential = New-Object pscredential 'DEV', (ConvertTo-SecureString -String '123' -AsPlainText -Force)
    New-BcContainer `
        -accept_eula `
        -accept_outdated `
        -containerName $containerName `
        -artifactUrl $artifactUrl `
        -Credential $credential `
        -auth UserPassword `
        -updateHosts `
        -myscripts @("https://raw.githubusercontent.com/microsoft/nav-docker/master/override/issue2434/HelperFunctions.ps1")        
}