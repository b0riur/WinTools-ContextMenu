$UserTemp = $env:TEMP
Stop-Service wuauserv -Force -ErrorAction SilentlyContinue

$Caminhos = @(
    "$UserTemp\*",
    "C:\Windows\Temp\*",
    "C:\Windows\SoftwareDistribution\Download\*",
    "C:\Windows\Prefetch\*",
    "C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*"
)

foreach ($Caminho in $Caminhos) {
    Remove-Item -Path $Caminho -Recurse -Force -ErrorAction SilentlyContinue
}

Start-Service wuauserv -ErrorAction SilentlyContinue
