#!/bin/sh

# Author: Danny
# Version GIT: 2021-07-05 21:10

# invoke-scriptanalyser.sh
# Start the ScriptAnalyser via powershell

pwsh -Command "Invoke-ScriptAnalyzer -EnableExit -Recurse -Path ."