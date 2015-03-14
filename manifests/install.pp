class exchange::install (
  $installerlocation,
  $setupmode,
  $acceptexchangelicense,
  $roles,
  $installwindowscomponents,
  $orgname,
  $targetdir,
  $sourcedir,
  $updatesdir,
  $domaincontroller,
  $answerfile,
  $donotstarttransport,
  $enableerrorreporting,
  $customerfeedbackenabled,
  $addumlanguagepack,
  $removeumlanguagepack,
  $newprovisionedserver,
  $removeprovisionedserver
  $mdbname,
  $dbfilepath,
  $logfolderpath,
  $activedirectorysplitpermissions,
  $tenantorganizationconfig,
  ){

  unless $setupmode = undef {
    $options += "/mode:$setupmode ",
  }
  unless $acceptexchangelicense = false,
    $options += '/IAcceptExchangeServerLicenseTerms ",
  }
  unless $roles = undef {
    $options += "/Roles:$roles ",
  }
  unless $installwindowscomponents = undef {
    $options += '/InstallWindowsComponents ',
  }
  unless $orgname = undef {
    $options += "/OrganizationName:$orgname ",
  }
  unless $targetdir = undef {
    $options += "/TargetDir:$targetdir ",
  }
  unless $sourcedir = undef {
    $options += "/SourceDir:$sourcedir ",
  }
  unless $updatesdir = undef {
    $options += "/UpdatesDir:$updatesdir ",
  }
  unless $domaincontroller = undef {
    $options += "/DomainController:$domaincontroller ",
  }
  unless $answerfile = undef {
    $options += "/AnswerFile:$answerfile ",
  }
  unless $donotstarttransport = undef {
    $options += '/DoNotStartTransport ',
  }
  unless $enableerrorreporting = undef {
    $options += '/EnableErrorReporting ',
  }
  unless $customfeedbackenabled = undef {
    $options += "/CustomFeedBackEnabled:$customfeedbackenabled ",
  }
  unless $addumlanguagepack = undef {
    $options += "/AddUmLanguagePack:$addumlanguagepack ",
  }
  unless $removeumlanguagepack = undef {
    $options += "/RemoveUmLanguagePack:$removeumlanguagepack ",
  }
  unless $newprovisionedserver = undef {
    $options += "/NewProvisionedServer:$newprovisionedserver ",
  }
  unless $removeprovisionedserver = undef {
    $options += "/RemoveProvisionedServer:$removeprovisionedserver ",
  }
  unless $mdbname = undef {
    $options += "/MdbName:$mdbname ",
  }
  unless $dbfilepath = undef {
    $options += "/DbFilePath:$dbfilepath ",
  }
  unless $logfolderpath = undef {
    $options += "/LogFolderPath:$logfolderpath ",
  }
  unless $activedirectorysplitpermissions = undef {
    $options += "/ActiveDirectorySplitPermissions:$activedirectorysplitpermissions "
  }
  unless $tenantorganizationconfig = undef {
    $options += "/TenantOrganizationConfig:$tenantorganizationconfig ",
  }

  if $installerlocation =~ /^http/ {
    exec { 'download installer':
      command => "$client = new-object System.Net.WebClient; $client.DownloadFile('$installlocation','C:/tmp/Exchange-x64.exe')",
      provider => 'powershell',
      creates => 'C:/tmp/Exchange-x64.exe',
    }
    $installerlocation = 'C:/tmp/Exchange-x64.exe'
  }
  if $installerlocation =~ /Exchange-x64.exe/ {
    exec { 'extract installer':
      command => "$installerlocation /extract:C:/tmp/Exchange2013",
      provider => 'powershell',
      creates => 'C:/tmp/Exchange2013/setup.exe',
    }
    $installerlocation = 'C:/tmp/Exchange2013/setup.exe'

  exec { 'install exchange':
    command => "$installerlocation $options",
  }

}
