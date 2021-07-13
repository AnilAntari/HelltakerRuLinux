#!/usr/bin/env bash

[ -x "$(command -v bsdtar)" ] && TAR="bsdtar" || TAR="tar"

echo '
--------------------------
|                        |
|                        |
|  Helltaker Ru Linux    |
|                        |
|                        |
--------------------------
'

VER="1.0"

LINK="https://github.com/AnilAntari/HelltakerRuLinux/releases/download/$VER/generic.tar.gz"
GAMEPATH="$HOME/.local/share/Steam/steamapps/common/Helltaker"

[ -d "$GAMEPATH" ] && {
	echo "Игра была найдена в ${GAMEPATH}"
} || {
	read -rp "Игра не была найдена в $GAMEPATH, укажите путь к игре: " GAMEPATH
	[ -d "$GAMEPATH" ] || { echo "Игра не была найдена в $GAMEPATH, выход " ; exit 1 ; }
}

echo "Загрузка"
wget "$LINK"

$TAR -xzvf generic.tar.gz && cp -r generic/helltaker_Data/* "$GAMEPATH/helltaker_lnx_Data/"
cp -r generic/local/* "$GAMEPATH/local/" && cp -r generic/localhm/* "$GAMEPATH/localHM"

rm -r generic && rm generic.tar.gz

echo "Готово"
