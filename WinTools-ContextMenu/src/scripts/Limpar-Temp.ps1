# =====================================================================
# SCRIPT DE LIMPEZA COMPLETA DE SISTEMA E ARQUIVOS TEMPORÁRIOS
# =====================================================================

$UserTemp = $env:TEMP
$LocalAppData = $env:LOCALAPPDATA

# Para o serviço de update para liberar a pasta SoftwareDistribution
Stop-Service wuauserv -Force -ErrorAction SilentlyContinue

$Caminhos = @(
    # Temporários do Usuário e do Sistema
    "$UserTemp\*",
    "C:\Windows\Temp\*",
    "C:\Windows\SoftwareDistribution\Download\*",
    "C:\Windows\Prefetch\*",
    "C:\ProgramData\Microsoft\Windows\WER\ReportQueue\*",
    
    # Logs do Sistema e Otimizações de Entrega do Windows
    "C:\Windows\Logs\CBS\*",
    "C:\Windows\Logs\DISM\*",
    "C:\Windows\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization\Cache\*",
    
    # Cache de Shaders das Placas de Vídeo (NVIDIA e AMD)
    "$LocalAppData\NVIDIA\DXCache\*",
    "$LocalAppData\NVIDIA\GLCache\*",
    "$LocalAppData\AMD\DxCache\*",
    
    # Cache de Arquivos do Chrome e Edge (Apenas temporários)
    "$LocalAppData\Google\Chrome\User Data\Default\Cache\*",
    "$LocalAppData\Microsoft\Edge\User Data\Default\Cache\*"
)

foreach ($Caminho in $Caminhos) {
    Remove-Item -Path $Caminho -Recurse -Force -ErrorAction SilentlyContinue
}

# Reinicia serviço do Windows Update
Start-Service wuauserv -ErrorAction SilentlyContinue
