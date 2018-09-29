#!/bin/sh
CURRENT_DIR=`pwd`
RED="\033[1;31m"
NOCOLOR="\033[0m"
welcome() {
	echo "Добро пожаловать! Выбирите действие:"
	echo "[1] Создать каталог"
	echo "[2] Сменить текущий каталог"
	echo "[3] Напечатать содержимое текущего каталога"
	echo "[4] Переместить файл"
	echo "[5] Удалить каталог с его содержимым"
	echo "[6] Выйти из программы"
}

while true :
do
	welcome
	read line
	case $line in
		1)
			echo "Введите название каталога:"
			read catalog_name
			mkdir "$catalog_name" 2>> $CURRENT_DIR/lab1_err || echo "${RED}Неудалось создать каталог${NOCOLOR}"
		;;
		2)
			echo "Введите каталог:"
			read catalog_name
			cd "$catalog_name" 2>> $CURRENT_DIR/lab1_err || echo "${RED}Неудалось перейти в каталог${NOCOLOR}"
		;;
		3)
			ls 2>> $CURRENT_DIR/lab1_err
		;;
		4)
			echo "Файл для перемещения:"
			read current_path
			echo "Куда перенести:"
			read target_path
			mv "$current_path" "$target_path" 2>> $CURRENT_DIR/lab1_err || echo "${RED}Неудалось переместить файл${NOCOLOR}"
		;;
		5)
			echo "Введите каталог:"
			read catalog_name
			echo "rm: удалить каталог \"$catalog_name\"?"
			read answer
			if [ "${answer}" = "y" ] || [ "${answer}" = "Y" ];
			then
				rm -R "$catalog_name" 2>> $CURRENT_DIR/lab1_err || echo "${RED}Неудалось удалить каталог${NOCOLOR}"
			fi
		;;
		6)
			exit 0
		;;
		*)
			exit 0
		;;
	esac
done


