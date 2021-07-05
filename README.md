# Docker-powershell-scriptanalyzer

HDCore extended Powershell PSScriptAnalyzer linux docker image
Based on Powershell 6.2.4 on Linux Alpine 3.8

```
FROM hdcore/docker-psscriptanalyzer:1
```

# FAQ

## Building the image

### Default

```bash
docker-compose build

docker-compose build local-psscriptanalyser1-run
```

## Running the image

```bash
docker-compose run --rm local-psscriptanalyser1-run

docker-compose run --rm local-psscriptanalyser1-run /bin/sh

docker-compose run --rm local-psscriptanalyser1-run pwsh

docker-compose run --rm local-psscriptanalyser1-run pwsh -Command "xxxx"
```

## Scripts

### Default
Attention: no bash present!
- /bin/sh

### PS Script Analyzer
- invoke-scriptanalyzer.sh
- pwsh -Command "Invoke-ScriptAnalyzer -EnableExit -Recurse -Path ."

### Powershell
- pwsh