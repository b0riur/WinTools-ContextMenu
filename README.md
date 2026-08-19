# 🛠️ WinTools-ContextMenu

[![Windows 10/11](https://img.shields.io/badge/Windows-10%20%7C%2011-blue?logo=windows)](https://www.microsoft.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PowerShell](https://img.shields.io/badge/PowerShell-5.1%2B-blue?logo=powershell)](https://github.com/PowerShell/PowerShell)

Utilitários de otimização e manutenção de sistema integrados diretamente ao menu do botão direito (menu de contexto) do Windows 10 e 11.

---

## ⚡ Funcionalidades

### 🧰 Menu `Tools`
* **Limpar Temp:** Remove caches do Windows Update (`SoftwareDistribution`), temporários do sistema/usuário, `Prefetch` e logs de erro (`WER`).
* **Limpar RAM Profunda:** Limpeza em nível *Sysinternals RAMMap* (esvazia Working Sets, System Working Set, Modified Page List e Standby List).
* **Reiniciar Explorer:** Reinicia o `explorer.exe` instantaneamente para destravar a interface sem reiniciar o PC.

### 🔋 Menu `Planos de Energia`
* **Economia de Energia:** Alterna rapidamente para o perfil de baixo consumo.
* **Ultra Desempenho:** Desbloqueia e ativa o perfil de alta performance oculto do Windows.

---

## 🚀 Instalação Rápida

1. Baixe o pacote na aba [Releases](../../releases).
2. Extraia o arquivo `.zip`.
3. Execute o **`Install.bat`** (solicitará permissão de Administrador).

> 💡 Os scripts são salvos automaticamente em `C:\ProgramData\WinTools\` para garantir funcionamento universal em qualquer PC.

---

## 🗑️ Desinstalação

Para remover totalmente os atalhos e scripts:
1. Execute o **`Uninstall.bat`**.
2. Os menus do registro e os arquivos instalados em `C:\ProgramData\WinTools\` serão removidos de forma limpa.

---

## 📂 Estrutura do Repositório

```text
WinTools-ContextMenu/
├── src/
│   ├── scripts/          # Scripts PowerShell (.ps1)
│   └── registry/         # Arquivos de Registro (.reg)
├── Install.bat           # Instalador automático
├── Uninstall.bat         # Desinstalador automático
├── LICENSE               # Licença MIT
└── README.md             # Documentação
