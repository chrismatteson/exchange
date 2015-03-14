class exchange (  
  $installerlocation = $exchange::params::installerlocation,
  $mode = $exchange::params::mode,
  $acceptexchangeserverlicense = $exchange::params::acceptexchangeserverlicense,
  $installwindowscomponents = $exchange::params::installwindowscomponents,
  $organizationname = $exchange::params::organizationname,
  $targetdir = $exchange::params::targetdir,
  $sourcedir = $exchange::params::sourcedir,
  $updatesdir = $exchange::params::updatesdir,
  $domaincontroller = $exchange::params::domaincontroller,
  $disableamfiltering = $exchange::params::disableamfiltering,
  $answerfile = $exchange::params::answerfile,
  $donotstarttransport = $exchange::params::donotstarttransport,
  $enableerrorreporting = $exchange::params::enableerrorreporting,
  $customerfeedbackenabled = $exchange::params::customerfeedbackenabled,
  $addumlanguage = $exchange::params::addumlanguage,
  $removeumlanguage = $exchange::params::removeumlanguage,
  $newprovisionserver = $exchange::params::newprovisionserver,
  $removeprovisionserver = $exchange::params::removeprovisionserver,
  $mdbname = $exchange::params::mdbname,
  $dbfilepath = $exchange::params::dbfilename,
  $logfolderpath = $exchange::params::logfolderpath,
  $activedirectorysplitpermissions = $exchange::params::activedirectorysplitpermissions,
  $tenantorganizationconfig = $exchange::params::tenantorganizationconfig,
  ){

  exec { 'install':
    command => '$installpath/setup.exe /mode:$mode /$acceptexchangeserverlicense /$roles /$installwindowscomponents /$organizationname /$targetdir /$sourcedir 
