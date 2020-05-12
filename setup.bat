set /p SolutionName=Enter solution name:
set /p CompanyName=Enter company name:
rename Solution.sln %SolutionName%.sln
powershell -Command "(gc %SolutionName%.sln -raw) -replace '\[SolutionGuid\]', [guid]::NewGuid() | set-content -NoNewline %SolutionName%.sln"
powershell -Command "(gc %SolutionName%.sln -raw) -replace '\[SolutionItemsGuid\]', [guid]::NewGuid() | set-content -NoNewline %SolutionName%.sln"
powershell -Command "(gc %SolutionName%.sln -raw) -replace '\[Solution.sln.DotSettings\]', '%SolutionName%.sln.DotSettings' | set-content -NoNewline %SolutionName%.sln"
rename Solution.sln.DotSettings %SolutionName%.sln.DotSettings
powershell -Command "(gc %SolutionName%.sln.DotSettings -raw) -replace '\[CompanyName\]', '%CompanyName%' | set-content -NoNewline  %SolutionName%.sln.DotSettings"
powershell -Command "(gc stylecop.json -raw) -replace '\[CompanyName\]', '%CompanyName%' | set-content -NoNewline  stylecop.json"
del setup.bat