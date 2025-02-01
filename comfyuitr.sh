#!/bin/bash

CONFIG_FILE="$HOME/.comfyui_runner_config"

function set_path {
    echo "ComfyUI yolunu girin:"
    read path
    echo "$path" > "$CONFIG_FILE"
    echo "Yol kaydedildi: $path"
}

function remove_path {
    if [ -f "$CONFIG_FILE" ]; then
        rm "$CONFIG_FILE"
        echo "Kayıtlı yol kaldırıldı."
    else
        echo "Zaten kayıtlı bir yol yok."
    fi
}

function run_comfyui {
    if [ ! -f "$CONFIG_FILE" ]; then
        echo "Önce yol ayarlayın: comfyuirun -Set"
        exit 1
    fi

    COMFYUI_PATH=$(cat "$CONFIG_FILE")

    if [ ! -f "$COMFYUI_PATH/main.py" ]; then
        echo "Belirtilen dizinde main.py bulunamadı!"
        exit 1
    fi

    source myenv/bin/activate
    python "$COMFYUI_PATH/main.py"
}

case "$1" in
    -Set|-S)
        set_path
        ;;
    -Remove|-R)
        remove_path
        ;;
    *)
        run_comfyui
        ;;
esac
