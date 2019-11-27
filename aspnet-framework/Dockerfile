# escape=`

FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Microsoft is not willing to enable URL Rewrite Module by default,
# so we must do it here (https://github.com/microsoft/dotnet-framework-docker/issues/369)
ADD https://download.microsoft.com/download/1/2/8/128E2E22-C1B9-44A4-BE2A-5859ED1D4592/rewrite_amd64_en-US.msi c:/inetpub/rewrite_amd64_en-US_2.1.msi
RUN Start-Process c:/inetpub/rewrite_amd64_en-US_2.1.msi -ArgumentList "/qn" -Wait

# unlock authentication modes in global configuration, since we use them in our web.config files
RUN C:/Windows/System32/inetsrv/appcmd.exe unlock config -section:"system.webServer/security/authentication/anonymousAuthentication" -commit:apphost; `
    C:/Windows/System32/inetsrv/appcmd.exe unlock config -section:"system.webServer/security/authentication/windowsAuthentication" -commit:apphost

# copy debug script to C:/debug.ps1; when this is run, it starts
# a dbgview process (redirecting output to a log file) and a LogMonitor
# process that interleaves debug output with IIS/Application event log
# output to STDOUT
COPY debug.ps1 /

# add C:/docker/dbgview.exe for use with debug.ps1
ADD https://live.sysinternals.com/Dbgview.exe /docker/dbgview.exe

# add LogMonitor for redirecting various output/event sources to stdout
# (see https://github.com/microsoft/windows-container-tools/tree/master/LogMonitor)
ADD https://github.com/microsoft/windows-container-tools/releases/download/v1.0/LogMonitor.exe /docker/LogMonitor.exe
COPY LogMonitorConfig.json /docker/
