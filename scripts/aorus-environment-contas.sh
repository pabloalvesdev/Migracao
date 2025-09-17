#!/bin/bash

MOBILE_MODE=false

#processa os argumentos
while [[ "$#" -gt 0 ]]; do
    case "$1" in
        --mobile)
            MOBILE_MODE=true
            ;;
        *)
            echo "Parametro desconhecido: $1"
            echo 1
            ;;
    esac
    shift
done

if [ "$MOBILE_MODE" = true ]; then
    # Abre o vscode
    code ~/Documentos/Projects/Mobile/ContasWIthProtectedRoute
    # Sobe o emulador
    gnome-terminal -- bash -c "emulator -avd meu_emulador_android_33 -gpu host -no-boot-anim; exec bash"
    # Sobe o expo
    gnome-terminal -- bash -c "cd ~/Documentos/Projects/Mobile/ContasWIthProtectedRoute; npx expo start; exec bash" &
else
    # Abre o vscode
    code ~/Documentos/Projects/Web/contas-v-2.0
    # Sobe o expo
    gnome-terminal -- bash -c "cd ~/Documentos/Projects/Web/contas-v-2.0; npx next dev; exec bash" &
    sleep 5
    firefox --new-window "http://localhost:3000"
fi



# Sobe a API
gnome-terminal -- bash -c "cd ~/Documentos/Projects/Api/ContasDotNet/Contas; dotnet run; exec bash"

# Desassocia os processos dos terminais abertos
disown
