# HDCore extended docker images
ARG VERSION=6.2.4-alpine-3.8
FROM mcr.microsoft.com/powershell:${VERSION}
ARG VERSION

# https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL "maintainer"="HDCore"
LABEL "org.opencontainers.image.ref.name"="hdcore/docker-psscriptanalyzer:1"
LABEL "org.opencontainers.image.title"="HDCore extended powershell psscriptanalyzer image"
LABEL "org.opencontainers.image.source"="https://github.com/hdcore/docker-psscriptanalyzer"
LABEL "org.opencontainers.image.url"="https://hub.docker.com/repository/docker/hdcore/docker-psscriptanalyzer"

# Workdir
WORKDIR /workdir

# Copy scripts and add to the path
COPY ./scripts/* /usr/local/bin/hdcore/
RUN chmod +x /usr/local/bin/hdcore/*.sh
ENV PATH="/usr/local/bin/hdcore:${PATH}"

# Source PSScriptAnalyzer in docker
# https://www.benjaminrancourt.ca/lint-powershell-scripts-with-psscriptanalyzer

SHELL [ "pwsh", "-Command" ]
# Remove some compatibility profiles to reduce image size
# https://github.com/PowerShell/PSScriptAnalyzer/blob/master/RuleDocumentation/UseCompatibleCommands.md
RUN Set-PSRepository -ErrorAction Stop -InstallationPolicy Trusted -Name PSGallery; \
    Install-Module -ErrorAction Stop -Name PSScriptAnalyzer -MaximumVersion 1.99.99; \
    Remove-Item "/root/.local/share/powershell/Modules/PSScriptAnalyzer/*/compatibility_profiles/win-8_x64_6.2.9200*"; \
    Remove-Item "/root/.local/share/powershell/Modules/PSScriptAnalyzer/*/compatibility_profiles/win-8_x64_6.3.9600*"; \
    Remove-Item "/root/.local/share/powershell/Modules/PSScriptAnalyzer/*/compatibility_profiles/win-8_x64_10.0.14393*"; \
    Remove-Item "/root/.local/share/powershell/Modules/PSScriptAnalyzer/*/compatibility_profiles/ubuntu*"
SHELL [ "/bin/sh" , "-c" ]

# Image build details
RUN echo "Build date: $(date)\n" > /var/log/hdcore-image.log && pwsh -Version > /var/log/hdcore-image.log && pwsh -Command "Get-InstalledModule PSScriptAnalyzer" > /var/log/hdcore-image.log

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["/bin/sh"]
