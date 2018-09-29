#!/usr/bin/bash
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
			read -r catalog_name || exit 0
			mkdir -- "$catalog_name" 2>> $HOME/lab1_err || echo "Неудалось создать каталог" >&2
		;;
		2)
			echo "Введите каталог:"
			read -r catalog_name || exit 0
			cd -- "$catalog_name" 2>> $HOME/lab1_err || echo "Неудалось перейти в каталог" >&2
		;;
		3)
			if [ -d $(pwd) ]
			then
				ls
			else
				echo "Неудалось просмотреть содержимое каталога" >&2
			fi
		;;
		4)
			echo "Файл для перемещения:"
			read -r current_path || exit 0
			echo "Куда перенести:"
			read -r target_path || exit 0
			mv -- "$current_path" "$target_path" 2>> $HOME/lab1_err || echo "Неудалось переместить файл" >&2
		;;
		5)
			echo "Введите каталог:"
			read -r catalog_name || exit 0
			if [ -d $catalog_name ]
			then
				echo "rm: remove directory $catalog_name (yes/no)?"
				read -r answer || exit 0
				if [ $answer = yes ] || [ $answer = y ]
				then
					rm -R -- "$catalog_name" 2>> $HOME/lab1_err || echo "Неудалось удалить каталог" >&2
				fi
			else
				echo "Каталог не существует!" >&2
			fi
		;;
		6)
			echo "Пока"
			exit 0
		;;
	esac
done


