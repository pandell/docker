# starts the LogMonitor process, wrapping dbgview, and pipes
# various output sources to stdout
Start-Process -FilePath C:/docker/LogMonitor.exe -ArgumentList "/config","C:/docker/LogMonitorConfig.json","C:/docker/dbgview.exe","/l","C:/docker/dbgview-output.log","/g","/n","/accepteula" -NoNewWindow -Wait