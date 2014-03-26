; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "tellurium"
;#define MyAppVersion "0.0.0"  read from file, see below
#define MyAppPublisher "University of Washington, Seattle, WA, USA"
#define MyAppURL "http://tellurium.analogmachine.org/"
#define MyAppSetupIconFile "tellurium_icon_64x64.ico"
#define ThisInstallerPostfix "win32-superpack-setup"

#define LibRoadRunnerInstaller "pylibroadrunner-1.1.0-beta1-win_32" 
;leave .zip off the LibRoadRunnerInstaller var above

#define AntimonyInstaller "AntimonyPythonBindings-2.5.1-win32.exe"
#define TelPluginsInstaller "telplugins-1.0.7-Python-2.7-win32-minimal-setup.exe"
#define PyInstaller "python-2.7.6.msi"
#define NumpyInstaller "numpy-1.8.0-win32-superpack-python2.7.exe"
#define MatplotlibInstaller "matplotlib-1.3.1.win32-py2.7.exe"
;#define DateutilInstaller "python-dateutil-2.2.win32-py2.7.exe"
;#define PyparsingInstaller "pyparsing-2.0.1.win32-py2.7.exe"
;#define SixInstaller "six-1.5.2.win32-py2.7.exe"

#define PyQtInstaller "PyQt4"
#define SipInstaller "sip.pyd"
#define PipInstaller "get-pip.py"
#define SpyderInstaller "spyder-2.2.5-tellurium.win32.exe"
#define Unzip "unzip.exe"


;add spyder source
;then do ":python setup.py install" to install

;downloads turned off, installers packaged
;#define LibRoadRunnerInstallerURL "http://sourceforge.net/projects/libroadrunner/files/roadrunner-1.0.1-rc1-win32-minimal-setup.exe"
;#define AntimonyInstallerURL "http://sourceforge.net/projects/antimony/files/Windows%20binaries/2.5/AntimonyPythonBindings-2.5.0-win32.exe"
;#define PyInstallerURL "http://python.org/ftp/python/2.7.6/python-2.7.6.msi" 
;#define NumpyInstallerURL "http://downloads.sourceforge.net/project/numpy/NumPy/1.8.0/numpy-1.8.0-win32-superpack-python2.7.exe?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fnumpy%2Ffiles%2FNumPy%2F&ts=1390956336&use_mirror=softlayer-ams"
;#define MatplotlibInstallerURL "https://downloads.sourceforge.net/project/matplotlib/matplotlib/matplotlib-1.3.1/matplotlib-1.3.1.win32-py2.7.exe"
;#define DateutilInstallerURL "http://www.lfd.uci.edu/~gohlke/pythonlibs/#python-dateutil" ;there does not appear to be a direct URL to the file
;#define PyparsingInstallerURL "http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyparsing" The one from "http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-2.0.1/pyparsing-2.0.1.win32-py2.7.exe" did not work.
;#define SixInstallerURL "http://www.lfd.uci.edu/~gohlke/pythonlibs/#six"
;#define PyQtInstallerURL "http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.10.3/PyQt4-4.10.3-gpl-Py2.7-Qt4.8.5-x32.exe/download"
;#define SipInstallerURL "http://www.riverbankcomputing.com/software/sip/download" #using file from bin install
;#define PipInstallerURL "https://raw.github.com/pypa/pip/master/contrib/get-pip.py"
;#define SpyderInstallerURL "https://bitbucket.org/spyder-ide/spyderlib/downloads/spyder-2.2.5.win32.exe"
;#define unzipURL "http://stahlworks.com/dev/unzip.exe"
 
#define Py "Python"
#define PyVer "2.7"
#define Numpy "numpy"
;#define NumpyVer "1.0"
#define Matplotlib "matplotlib"
;#define MatplotlibVer "1.0"
#define AppDir "tellurium"
#define Pip "pip.exe"

#define VerFile FileOpen("../../VERSION.txt")
#define MyAppVersion FileRead(VerFile)
#expr FileClose(VerFile)
#undef VerFile

;Used for downloader
;#include ReadReg(HKEY_LOCAL_MACHINE,'Software\Sherlock Software\InnoTools\Downloader','ScriptPath','');

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{2EA1F666-39FE-4A26-BCC9-4D534219C9AE}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DisableWelcomePage=yes
DefaultDirName={code:SetAppDirPath}
;DefaultDirName=C:\Python27\Lib\site-packages\{#AppDir}

;enable the next line for debug only
;DisableDirPage=yes


;DefaultGroupName=libRoadRunner
DisableProgramGroupPage=yes
;LicenseFile=..\..\LICENSE
;InfoBeforeFile=..\..\NOTICE.txt
;InfoAfterFile=README.md
DisableReadyPage=yes
;DisableFinishedPage=yes   ;finished page is good feedback
OutputDir=.
OutputBaseFilename={#MyAppName}-{#MyAppVersion}-{#Py}-{#PyVer}-{#ThisInstallerPostfix}
SetupIconFile={#MyAppSetupIconFile}
Compression=lzma
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]  
Source: "../../tellurium.py"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../__init__.py"; DestDir: "{app}"; Flags: ignoreversion
;copy example to app dir, for temp file, this will open by default at first run
Source: "../../examples/tellurium-files/*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs
;copy example to tellurium-files as example file
Source: "../../examples/tellurium-files/*"; DestDir: "{userdocs}\tellurium-files"; Flags: ignoreversion recursesubdirs

Source: "../../NEWS.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../LICENSE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../VERSION.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../README.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "../../NOTICE.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "super_installer_dependencies\{#LibRoadRunnerInstaller}.zip"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "super_installer_dependencies\{#AntimonyInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "super_installer_dependencies\{#TelPluginsInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "super_installer_dependencies\{#Unzip}"; DestDir: "{tmp}"; Flags: ignoreversion deleteafterinstall
Source: "libRoadrunner-installer-dependencies\{#MatplotlibInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion
;-Source: "libRoadrunner-installer-dependencies\{#DateutilInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist
;-Source: "libRoadrunner-installer-dependencies\{#PyparsingInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist 
;-Source: "libRoadrunner-installer-dependencies\{#SixInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist
Source: "libRoadrunner-installer-dependencies\{#NumpyInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "libRoadrunner-installer-dependencies\{#PyInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "libRoadrunner-installer-dependencies\{#PipInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion
Source: "super_installer_dependencies\pip_cache\*"; DestDir: "{tmp}\pip_cache"; Flags: ignoreversion recursesubdirs

Source: "spyder_dependencies\{#PyQtInstaller}\*"; DestDir: "{code:SetPythonSitePackagesPath}\{#PyQtInstaller}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "spyder_dependencies\{#SipInstaller}"; DestDir: "{code:SetPythonSitePackagesPath}"; Flags: ignoreversion
;Source: "{#SpyderInstaller}\*"; DestDir: "{tmp}\{#SpyderInstaller}"; Flags: ignoreversion recursesubdirs createallsubdirs
;the line above was tried to attempt a direct install using setup.py, but this process does not install icons/ shortcuts for windows, there is no way to do that w/o serious work
;the line below copies the exe spyder installer
Source: "spyder_dependencies\{#SpyderInstaller}"; DestDir: "{tmp}"; Flags: ignoreversion onlyifdoesntexist
;Spyder installer is a custom distro with the following mod at the end of scientific_startup.py
;from tellurium import *
Source: "../../roadrunner.conf"; DestDir: "{tmp}"; Flags: ignoreversion ; AfterInstall: CopyConfToRoadRunner() 


; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Run]
Filename: "{code:SetPythonPath}\python.exe"; Parameters: "{tmp}\{#PipInstaller}"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install python-dateutil pyparsing six ipython[all] sphinx pyflakes pylint pep8 psutil pygments --no-index --find-links {tmp}/pip_cache"; WorkingDir: "{tmp}/pip_cache"; Flags: shellexec waituntilterminated
;in the line above the --no-index --find-links {tmp}/pip_cache means no network, some subpackages are still missing, these flags are removed below
Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install python-dateutil pyparsing six sphinx pyflakes pylint pep8 psutil pygments docutils ipython[all]"; WorkingDir: "{tmp}/pip_cache"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install pyparsing"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install six"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated

;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install ipython[all]"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install sphinx"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install pyflakes"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install pylint"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install pep8"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install psutil"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install docutils"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
Filename: "{code:SetPythonPath}\scripts\{#Pip}"; Parameters: "install jinja2"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated

Filename: "{tmp}\{#Unzip}"; Parameters: "{tmp}\{#LibRoadRunnerInstaller}.zip -d {tmp}"; WorkingDir: "{tmp}";
Filename: "{code:SetPythonPath}\python.exe"; Parameters: "setup.py install"; WorkingDir: "{tmp}\{#LibRoadRunnerInstaller}"; Flags: shellexec waituntilterminated
Filename: "{#AntimonyInstaller}"; Parameters: "/SILENT"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
Filename: "{#TelPluginsInstaller}"; Parameters: "/SILENT"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
;Filename: "{code:SetPythonPath}\python.exe"; Parameters: "setup.py install --install-script spyder_win_post_install.py"; WorkingDir: "{tmp}\{#SpyderInstaller}"; Flags: shellexec waituntilterminated
;the line above will not install the icons/ shortcuts for spyder in windows, bdist_wininst
;the line below will run the exe spyder installer which will work properly
Filename: "{#SpyderInstaller}"; Parameters: "/SILENT"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated
Filename: "{app}\README.TXT"; Description: "View the README file"; Flags: postinstall shellexec skipifsilent unchecked
Filename: "{code:SetPythonPath}\pythonw.exe"; Parameters:"{code:SetPythonPath}\scripts\spyder -w {userdocs}\tellurium-files"; Description: "Run Spyder for Tellurium"; Flags: postinstall shellexec skipifsilent waituntilterminated

;SCIPY pip install has an error, may need a fortran compiler! mingw, but do we need Scipy?
;Filename: "{#Pip}"; Parameters: "install scipy"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized

;MATPLOTLIB, on pip install, cannot find vcvarsall.bat, a symptom of missing the 2008 VS++ <-seriously you need to install a compiler
;Filename: "{#Pip}"; Parameters: "install matplotlib"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized

;NUMPY, on pip install, cannot find vcvarsall.bat, a symptom of missing the 2008 VS++ <-seriously you need to install a compiler
;Filename: "{#Pip}"; Parameters: "install numpy"; WorkingDir: "{tmp}"; Flags: shellexec waituntilterminated runmaximized

[Code]
//////////////////////////////////////////////////////////////////////////////
const
  appDir = '{#AppDir}';
  pyReg = 'SOFTWARE\{#Py}\PythonCore\{#PyVer}\InstallPath';
  pyRegWow6443Node = 'SOFTWARE\Wow6432Node\{#Py}\PythonCore\{#PyVer}\InstallPath';

var
  installPython, installMatplot, installNumpy: Boolean;
  AppDirPath: String;
  PythonPath: String;
  PythonSitePackagesPath: String;

//////////////////////////////////////////////////////////////////////////////
procedure ExitProcess(exitCode:integer);
  external 'ExitProcess@kernel32.dll stdcall';

//////////////////////////////////////////////////////////////////////////////
function GetPathForPython(): string;
var          
  InstallPath: string;
begin
  
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyReg, '', InstallPath) then
    begin
    Log('HKLM pyReg: '+ InstallPath);
    Result := InstallPath;
    end
  else
  if RegQueryStringValue(HKEY_CURRENT_USER, pyReg, '', InstallPath) then
    begin
    Log('HKCU pyReg: '+ InstallPath);
    Result := InstallPath; 
    end
  else
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyRegWow6443Node, '', InstallPath) then
    begin
    Log('HKLM pyRegWow6443Node: '+ InstallPath);
    Result := InstallPath;
    end
  else
    begin
    MsgBox('Our installer did not find your Python installation. You need '
    + 'Python to run {#MyAppName}. In the next step use [Your Python installation'
    + ' location]\Lib\site-packages\{#AppDir} directory.',mbError,MB_OK);
    //ExitProcess(1);
    end
end;

//////////////////////////////////////////////////////////////////////////////
function GetPathForPythonSitePackages(PythonPath: String): string;
begin
  Result := PythonPath + 'Lib\site-packages\';
end;

//////////////////////////////////////////////////////////////////////////////
function IsPythonInstalled(): Boolean;
var          
  InstallPath: string; //not really used here
begin
  
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyReg, '', InstallPath) then
    begin
    Result := True;
    end
  else
  if RegQueryStringValue(HKEY_CURRENT_USER, pyReg, '', InstallPath) then
    begin
    Result := True;
    end
  else
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, pyRegWow6443Node, '', InstallPath) then
    begin
    Result := True;
    end
  else
    begin
    Result := False;
    end
end;

//////////////////////////////////////////////////////////////////////////////
procedure GetPythonPaths();
begin  
  PythonPath := GetPathForPython();
  PythonSitePackagesPath := GetPathForPythonSitePackages(PythonPath);
  AppDirPath := PythonSitePackagesPath + AppDir;
end;

//////////////////////////////////////////////////////////////////////////////
function SetPythonPath(Param: String): String;
begin
  Result := PythonPath;
end;

//////////////////////////////////////////////////////////////////////////////
function SetPythonSitePackagesPath(Param: String): String;
begin
  Result := PythonSitePackagesPath;
end;

//////////////////////////////////////////////////////////////////////////////
function SetAppDirPath(Param: String): String;
begin
  Result := AppDirPath;
end;

//////////////////////////////////////////////////////////////////////////////
function IsInstalled(name: String): Boolean;
//function IsInstalled(name: string; version: string): boolean;  //ver not neeeded
var          
  InstallPath: string;
  reg : string;
begin
  //reg := 'Software\' + name + '\' + version
  // + '\InstallPath'
  // Log('reg Python: ' + reg)
  
  //if Numpy/ matplotlib installed - direct check for file
  InstallPath := PythonSitePackagesPath + name + '/__init__.py'
  Log('install dir: ' + InstallPath)
  if FileExists(InstallPath) then
  //if RegQueryStringValue(HKEY_CURRENT_USER, reg, 'InstallPath', InstallPath) then
   //numpy doesnt have a reg entry! (also gets its install path, not used here)
    begin 
    Result := True;
    end
  else 
    begin
    Result := False;
    end;
end;

//////////////////////////////////////////////////////////////////////////////
procedure RunMsiInstaller(execName: string);
var
  ResultCode: Integer;
  ExecPath: String;
  ExecCommand: String;
begin
  ExecPath := ExpandConstant('{tmp}\') + execName;
  ExecCommand := '/i ' + ExecPath + ''; //+ ' /qb'; //qb does it silently
 
  //Check that the msi installer file is present
  if FileExists(ExecPath) then
    begin
    Log('ExecPath exists : ' + ExecPath);
    end 
  else 
    begin
    Log('ExecPath doe not exist : ' + ExecPath);
    MsgBox('Could not find ' + execName + ' installer',mbError,MB_OK);
    ExitProcess(1);
    //something went wrong: hell or high water python installer must be there
    end;
  
  //execute msi installer, otherwie error and exit
  if not ShellExec('', 'msiexec.exe', ExecCommand, '', SW_SHOWNORMAL, 
                   ewWaitUntilTerminated, ResultCode) then
      //msi exec not working
      MsgBox('Msi installer failed to run!' + #13#10 + ExecCommand + ' ' +  
             SysErrorMessage(ResultCode), mbError, MB_OK);
end;

//////////////////////////////////////////////////////////////////////////////
function InitializeSetup(): Boolean;
var
tmpPy: String;
begin
  //if python installed get path for python site-packages
  //if isInstalled('{#Py}\PythonCore','{#PyVer}') then
  if IsPythonInstalled() then
  begin
    Log('Python: ' + 'True');
    installPython := False;
    //Python must be installed, get its path
    GetPythonPaths();
    Log('SetDefaultAppDirName: ' + AppDirPath);    
  end
  else //Add Python to tmp folder [ // or download list.. ]
  begin
    Log('Python: ' + 'False');
    installPython := True;
    tmpPy := ExpandConstant('{tmp}\{#PyInstaller}');
    //FileCopy(ExpandConstant('{#PyInstaller}'), tmpPy, false);
    ExtractTemporaryFile('{#PyInstaller}')
    Log('tmpPy: '+ tmpPy);

    AppDirPath := 'C:\Python27\Lib\site-packages\{#AppDir}' //pretend default path 
                                                            //will be used when python is installed
                                                            //not seeing another way to prepopulate
                                                            //the Dir Destination page.
                                                            //installing Pyton earlier not an option
                                                            //as {tmp} was not created yet, so cant
                                                            //extract python installer yet 
    //itd_addfile('{#PyInstallerURL}',ExpandConstant('{tmp}\{#PyInstaller}'));
    //itd_addfile('http://sbol.bhi.washington.edu/ppp/setup-dummyPython.exe',ExpandConstant('{tmp}\setup-dummyPython.exe'));
    PythonPath := 'C:\Python27';
    PythonSitePackagesPath := 'C:\Python27\Lib\site-packages\';
  end;

  Result := True; //Required for fwd progress, false would exist
end;

//////////////////////////////////////////////////////////////////////////////
procedure InitializeWizard();
begin
 //itd_init;  //turned off when packaging installers

  //Install Python now if needed, we want it in place before anything else is done
  if (installPython) then
     RunMsiInstaller('{#PyInstaller}');

  //Python must be installed, get its path
  GetPythonPaths();
  Log('SetDefaultAppDirName: ' + AppDirPath);

  //Check if Numpy is installed
  if IsInstalled('{#Numpy}') then
  //if IsInstalled('{#Numpy}','{#NumpyVer}') then  //ver not needed
    begin
    Log('Numpy: ' + 'True');
    installNumpy := False;
    end 
  else
    //Add Numpy to d/l list
    begin
    Log('Numpy: ' + 'False');
    installNumpy := True;

    //filecopy(ExpandConstant('{#NumpyInstaller}'),ExpandConstant('{tmp}\{#NumpyInstaller}'),false);
    ExtractTemporaryFile('{#NumpyInstaller}');

    //The following were used to test downloader srategy
    //itd_addfile('http://sbol.bhi.washington.edu/ppp/setup-dummyNump.exe',
    //            ExpandConstant('{tmp}\setup-dummyNump.exe'));
    end;
 
  //Check if Matplotlib is installed
  if IsInstalled('{#Matplotlib}') then
  //if IsInstalled('{#Matplotlib}','{#MatplotlibVer}') then   //ver not needed
    begin
    Log('Matplotlib: ' + 'True');
    installMatplot := False;
    end
  else
    //Add Matplotlib to d/l list
    begin
    Log('Matplotlib: ' + 'False');
    installMatplot := True;

    //filecopy(ExpandConstant('{#MatplotlibInstaller}'),ExpandConstant('{tmp}\{#MatplotlibInstaller}'),false);
    ExtractTemporaryFile('{#MatplotlibInstaller}');
    //ExtractTemporaryFile('{#DateutilInstaller}');
    //ExtractTemporaryFile('{#PyparsingInstaller}');
    //ExtractTemporaryFile('{#SixInstaller}');


    //The following were used to test downloader srategy
    //td_addfile('http://sbol.bhi.washington.edu/ppp/setup-dummyMatplot.exe',
    //            ExpandConstant('{tmp}\setup-dummyMatplot.exe'));
    end;

  //Downloads turned off, packaging installers.
  //Start the download after the "Ready to install" screen is shown
  //itd_downloadafter(wpReady);
end;

//////////////////////////////////////////////////////////////////////////////
procedure RunOtherInstaller(execName: string);
var
  ResultCode: Integer;
begin
  if not Exec(ExpandConstant('{tmp}\' + execName), '', '', SW_SHOWNORMAL,
    ewWaitUntilTerminated, ResultCode)
  then
    MsgBox('Other installer failed to run!' + #13#10 + execName +
      SysErrorMessage(ResultCode), mbError, MB_OK);
end; 

//////////////////////////////////////////////////////////////////////////////
// Install Numpy and Matplotlib if mising
procedure CurStepChanged(CurStep: TSetupStep);
var 
   ResultCode: Integer;
begin
  if CurStep=ssInstall then //If on the installation step
  //Lets install those files that were downloaded for us 
    begin 
    if ForceDirectories(ExpandConstant('{app}')) then 
      begin
      Log('app: ' + ExpandConstant('{app}'));
      if (installNumpy) then                                    
        RunOtherInstaller('{#NumpyInstaller}');
      if (installMatplot) then
        begin
        RunOtherInstaller('{#MatplotlibInstaller}');
        //RunOtherInstaller('{#DateutilInstaller}');
        //RunOtherInstaller('{#PyparsingInstaller}');
        //RunOtherInstaller('{#SixInstaller}');
        end;
      end;
    end;
end;

//////////////////////////////////////////////////////////////////////////////
// Install tellurium mod in spyder
//procedure MakeTelSpyder(FileName: String);
//begin
    //tmpPy := ExpandConstant('{tmp}\{#PyInstaller}');
//    FileCopy(ExpandConstant('{tmp}\scientific_startup.py'), FileName, false);
//    Log(ExpandConstant('{tmp}\scientific_startup.py') + ' :to: ' + FileName)
//end;

procedure CopyConfToRoadRunner();
var 
   FromFile: String;
   ToFile: String;
begin
  FromFile := ExpandConstant('{tmp}/roadrunner.conf')
  ToFile := PythonSitePackagesPath + '/roadrunner/roadrunner.conf'
  FileCopy(FromFile, ToFile, true)
end;