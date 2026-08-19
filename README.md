# 🛠️ WinTools-ContextMenu

[![Windows 10/11](https://img.shields.io/badge/Windows-10%20%7C%2011-blue?logo=windows)](https://www.microsoft.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell)](https://github.com/PowerShell/PowerShell)

Otimizações de sistema e utilitários integrados ao menu do botão direito (menu de contexto) do Windows 10 e 11.

---

## ⚡ Funcionalidades

### 🧰 Menu `Tools`
* **Limpar Temp:** Remove temporários de usuário/sistema, caches do Windows Update (`SoftwareDistribution`), logs (`CBS/DISM`), otimizações de entrega, `Prefetch`, relatórios de erro (`WER`), shader caches de GPU (NVIDIA/AMD) e caches de navegadores (Chrome/Edge).
* **Limpar RAM Profunda:** Executa uma limpeza equivalente às 5 etapas do *Sysinternals RAMMap* (Working Sets, System Working Set, Modified Page List e Standby List).
* **Reiniciar Explorer:** Reinicia o `explorer.exe` instantaneamente para destravar a interface sem reiniciar o PC.

### 🔋 Menu `Planos de Energia`
* **Economia de Energia:** Alterna para o perfil de baixo consumo.
* **Ultra Desempenho:** Desbloqueia e ativa o perfil de alta performance oculto do Windows.

---

## 🚀 Instalação Rápida

1. Baixe o pacote na aba [Releases](../../releases).
2. Extraia o arquivo `.zip`.
3. Execute o **`Install.bat`** (solicitará permissão de Administrador).
4. Selecione no menu interativo a opção desejada:
   * `[1]` Instalar TUDO (Tools + Planos de Energia)
   * `[2]` Instalar apenas o Menu **Tools**
   * `[3]` Instalar apenas o Menu **Planos de Energia**

> 💡 Os scripts são salvos em `C:\ProgramData\WinTools\` para garantir funcionamento universal no sistema.

---

## 🗑️ Desinstalação

Para remover totalmente os atalhos e scripts:
1. Execute o **`Uninstall.bat`**.
2. Os registros do Windows e a pasta `C:\ProgramData\WinTools\` serão limpos automaticamente.

---

## 📂 Estrutura do Repositório

```text
WinTools-ContextMenu/
├── src/
│   ├── scripts/          # Scripts PowerShell (.ps1)
│   └── registry/         # Arquivos de Registro (.reg)
├── Install.bat           # Instalador interativo e modular
├── Uninstall.bat         # Desinstalador automático
├── LICENSE               # Licença MIT
└── README.md             # Documentação
```

---

## 🛡️ Licença

Disponibilizado sob a [Licença MIT](LICENSE).
