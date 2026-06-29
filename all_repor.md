# Лабораторная работа №5. Git advanced workshop

## Цель работы

Целью лабораторной работы является изучение расширенных возможностей системы контроля версий Git.

В ходе работы были выполнены следующие действия:

1. Создание и клонирование репозитория.
2. Добавление файлов и выполнение коммитов.
3. Работа с ветками.
4. Отправка веток в удалённый репозиторий.
5. Моделирование конфликта слияния.
6. Разрешение конфликта.
7. Настройка Git Hook для проверки файлов перед коммитом.
8. Использование Git Flow.
9. Работа с feature, release и hotfix ветками.

## Используемое программное обеспечение

Для выполнения лабораторной работы использовались:

- Windows;
- WSL Ubuntu;
- Git;
- GitHub;
- git-flow;
- nano.

## Подготовка репозитория

На GitHub был создан репозиторий:

`lab-5-Maksimator171`

Для работы с репозиторием использовалась SSH-ссылка:

`git@github.com:Maksimator171/lab-5-Maksimator171.git`

Перед началом работы была проверена авторизация GitHub по SSH командой:

`ssh -T git@github.com`

GitHub успешно распознал пользователя:

`Hi Maksimator171! You've successfully authenticated, but GitHub does not provide shell access.`

После этого репозиторий был склонирован на локальную машину:

`git clone git@github.com:Maksimator171/lab-5-Maksimator171.git`

Далее был выполнен переход в папку репозитория:

`cd lab-5-Maksimator171`

Также были настроены имя пользователя и email для Git:

`git config --global user.name "Maksim"`

`git config --global user.email "maksim.prazdnikov@gmail.com"`

## Создание первого рабочего файла

Так как в репозитории уже был файл `README.md`, для выполнения лабораторной работы был создан отдельный файл:

`report.md`

В файл была добавлена базовая структура книги:

`# Название книги`

`## Глава 1: Введение`

`Здесь будет введение в тему книги.`

`## Глава 2: Основы Git`

`Основные понятия и команды Git.`

После создания файла были выполнены команды:

`git status`

`git add report.md`

`git commit -m "File added report.md"`

`git branch -M main`

`git push -u origin main`

В результате файл `report.md` был добавлен в ветку `main` и отправлен на GitHub.

<img width="744" height="367" alt="image" src="https://github.com/user-attachments/assets/5f94d86a-0646-4a9e-9b6d-b4e4ac36dfc6" />


## Создание ветки feature-login

Для разработки новой функциональности была создана ветка:

`feature-login`

Команда создания ветки:

`git checkout -b feature-login`

После перехода в новую ветку файл `report.md` был изменён. В него была добавлена новая глава:

`## Глава 3: Вход в систему`

`Раздел по новой функциональности входа в систему.`

После внесения изменений были выполнены команды:

`git status`

`git add report.md`

`git commit -m "Добавлена глава 3: Вход в систему"`

`git push -u origin feature-login`

В результате ветка `feature-login` была создана локально и отправлена в удалённый репозиторий.

<img width="840" height="598" alt="image" src="https://github.com/user-attachments/assets/489b6255-801c-4e47-a63b-8ce85909c73a" />


## Изменение файла в основной ветке main

После работы в ветке `feature-login` был выполнен переход обратно в ветку `main`:

`git checkout main`

Для проверки текущей ветки была выполнена команда:

`git branch`

После этого файл `report.md` был изменён в основной ветке.

В файл были внесены изменения:

`# Название книги: Приключения в мире Git`

`## Глава 1: Введение`

`Здесь будет введение в удивительный мир Git.`

`## Глава 2: Основы Git в основной ветке`

`Основные понятия Git, добавленные в основной ветке.`

После изменения файла были выполнены команды:

`git status`

`git add report.md`

`git commit -m "Изменено название книги и введение"`

`git push origin main`

В результате изменения были сохранены в ветке `main` и отправлены на GitHub.

<img width="740" height="638" alt="image" src="https://github.com/user-attachments/assets/1f75e963-c742-4d3d-8eff-28e0f09a1cd5" />


## Изменение файла в ветке feature-login

После изменения основной ветки был выполнен переход обратно в ветку `feature-login`:

`git checkout feature-login`

В этой ветке был изменён тот же участок файла `report.md`, чтобы далее смоделировать конфликт слияния.

В файл были внесены изменения:

`# Название книги: Приключения в мире Git`

`## Глава 1: Введение`

`Здесь будет введение в удивительный мир Git.`

`## Глава 2: Основы Git и магия конфликтов`

`Основные понятия и команды Git, а также волшебство разрешения конфликтов.`

`## Глава 3: Вход в систему`

`Раздел по новой функциональности входа в систему.`

После внесения изменений были выполнены команды:

`git status`

`git add report.md`

`git commit -m "Добавлен раздел о магии конфликтов"`

`git push origin feature-login`

Изменения были сохранены в ветке `feature-login` и отправлены в удалённый репозиторий.

<img width="659" height="630" alt="image" src="https://github.com/user-attachments/assets/c84151b3-6fe7-4812-a3f5-fc6dfa75be46" />


## Моделирование конфликта

Для моделирования конфликта был выполнен переход в ветку `main`:

`git checkout main`

Затем основная ветка была обновлена:

`git pull origin main`

После этого была выполнена попытка слияния ветки `feature-login` в ветку `main`:

`git merge feature-login`

Git обнаружил конфликт в файле `report.md`.

В терминале было выведено сообщение:

`CONFLICT (content): Merge conflict in report.md`

`Automatic merge failed; fix conflicts and then commit the result.`

Конфликт возник, потому что один и тот же участок файла был изменён в двух разных ветках.

<img width="595" height="102" alt="image" src="https://github.com/user-attachments/assets/31e9a243-b6ba-49ec-9650-135995ce903e" />


## Разрешение конфликта

Для разрешения конфликта файл `report.md` был открыт в редакторе:

`nano report.md`

В файле были удалены конфликтные метки:

`<<<<<<< HEAD`

`=======`

`>>>>>>> feature-login`

После разрешения конфликта был оставлен итоговый вариант текста:

`# Название книги: Приключения в мире Git`

`## Глава 1: Введение`

`Здесь будет введение в удивительный мир Git.`

`## Глава 2: Основы Git и магия конфликтов`

`Основные понятия и команды Git, а также волшебство разрешения конфликтов.`

`## Глава 3: Вход в систему`

`Раздел по новой функциональности входа в систему.`

После исправления файла были выполнены команды:

`git status`

`git add report.md`

`git commit -m "Resolved conflict in chapter 2"`

`git push origin main`

В результате конфликт был успешно разрешён, а итоговая версия файла была отправлена в ветку `main`.

<img width="626" height="500" alt="image" src="https://github.com/user-attachments/assets/aa6d5271-55f9-4d78-8e24-58a8f2421a8e" />


## Настройка pre-commit hook

Следующим этапом была выполнена настройка Git Hook для автоматической проверки формата `.txt` файлов перед коммитом.

Был создан скрипт:

`check_format.sh`

Скрипт проверяет, что каждый `.txt` файл в репозитории начинается со строки:

`TITLE:`

Содержимое скрипта:

`#!/bin/bash`

`echo "Running pre-commit format check..."`

`for file in *.txt; do`

`if [ -f "$file" ]; then`

`if ! head -n 1 "$file" | grep -q "^TITLE:"; then`

`echo "Format error in $file"`

`echo "Each .txt file must start with TITLE:"`

`exit 1`

`fi`

`fi`

`done`

`echo "Format check passed."`

`exit 0`

После создания скрипта он был скопирован в директорию Git hooks:

`cp check_format.sh .git/hooks/pre-commit`

Также были выданы права на выполнение:

`chmod +x .git/hooks/pre-commit`

`chmod +x check_format.sh`

## Проверка работы pre-commit hook

Для проверки работы hook был создан файл:

`bad_file.txt`

Сначала файл имел неправильный формат и не начинался со строки `TITLE:`.

После этого была выполнена попытка коммита:

`git add bad_file.txt check_format.sh`

`git commit -m "Проверка pre-commit hook"`

Коммит был остановлен скриптом.

В терминале было выведено сообщение:

`Running pre-commit format check...`

`Format error in bad_file.txt`

`Each .txt file must start with TITLE:`

Это подтвердило, что pre-commit hook работает и запрещает коммит файлов неправильного формата.

<img width="768" height="247" alt="image" src="https://github.com/user-attachments/assets/6e0961fe-613b-43e8-bf49-7650c5934bfb" />


После этого файл `bad_file.txt` был исправлен.

В начало файла была добавлена строка:

`TITLE: Git hook test`

После исправления была выполнена повторная попытка коммита:

`git add bad_file.txt check_format.sh`

`git commit -m "Добавлен pre-commit hook для проверки txt файлов"`

`git push origin main`

На этот раз проверка прошла успешно:

`Running pre-commit format check...`

`Format check passed.`

Коммит был создан и отправлен в ветку `main`.

<img width="737" height="380" alt="image" src="https://github.com/user-attachments/assets/bf544375-0809-4d5b-afa7-5ea09be0fe6e" />


## Установка git-flow

Для работы с Git Flow был установлен пакет `git-flow`.

Были выполнены команды:

`sudo apt update`

`sudo apt install git-flow -y`

После установки была проверена версия Git Flow:

`git flow version`

В результате была получена версия:

`1.12.3 (AVH Edition)`

<img width="710" height="361" alt="image" src="https://github.com/user-attachments/assets/0b7b29a0-6346-485d-a88f-bef3a3772d13" />


## Инициализация Git Flow

Git Flow использует две основные ветки:

- `main` — стабильная ветка;
- `develop` — ветка разработки.

Так как ветки `develop` изначально не было, она была создана вручную от ветки `main`.

Были выполнены команды:

`git checkout main`

`git pull origin main`

`git checkout -b develop`

`git push -u origin develop`

После этого была выполнена инициализация Git Flow:

`git flow init -d`

При инициализации использовались стандартные настройки:

- production branch: `main`;
- development branch: `develop`;
- feature prefix: `feature/`;
- release prefix: `release/`;
- hotfix prefix: `hotfix/`.

<img width="776" height="611" alt="image" src="https://github.com/user-attachments/assets/6f1ae566-c7c6-4ca5-991d-b66754dc43ff" />


## Создание feature-ветки task-management

Для разработки новой функциональности через Git Flow была создана feature-ветка:

`feature/task-management`

Команда создания:

`git flow feature start task-management`

Git Flow создал новую ветку на основе `develop` и переключил рабочую директорию на неё.

В этой ветке был создан файл:

`task_manager.py`

В файл был добавлен код:

`def create_task(title, description):`

`print(f"Создана новая задача: {title}")`

`print(f"Описание задачи: {description}")`

После создания файла были выполнены команды:

`git add task_manager.py`

`git commit -m "Добавлен функционал управления задачами"`

После завершения разработки feature-ветка была закрыта командой:

`git flow feature finish task-management`

Git Flow выполнил слияние feature-ветки в `develop` и удалил локальную feature-ветку.

Затем изменения были отправлены в удалённую ветку `develop`:

`git push origin develop`

<img width="665" height="780" alt="image" src="https://github.com/user-attachments/assets/daf82206-dae2-4232-86c5-695ae410e6de" />


## Создание release и hotfix

Для подготовки релиза была создана release-ветка:

`release/v1.0.0`

Команда создания:

`git flow release start v1.0.0`

После этого был создан файл:

`version.txt`

Так как ранее был настроен pre-commit hook для `.txt` файлов, файл `version.txt` был оформлен в правильном формате:

`TITLE: Version`

`v1.0.0`

После этого были выполнены команды:

`git add version.txt`

`git commit -m "Обновлена версия для релиза v1.0.0"`

Далее была выполнена команда завершения релиза:

`git flow release finish v1.0.0`

После завершения релиза изменения были отправлены в удалённый репозиторий:

`git push origin main`

`git push origin develop`

`git push origin --tags`

Также в ходе выполнения работы был создан hotfix:

`hotfix/hotfix-1.0.1`

Команда создания:

`git flow hotfix start hotfix-1.0.1`

Для моделирования исправления критической ошибки был создан файл:

`file_with_error.py`

В файл был добавлен код:

`def fixed_function():`

`print("Критическая ошибка исправлена")`

`fixed_function()`

После этого были выполнены команды:

`git add file_with_error.py`

`git commit -m "Исправлена критическая ошибка"`

Далее hotfix был завершён командой:

`git flow hotfix finish hotfix-1.0.1`

После завершения hotfix изменения были отправлены в удалённый репозиторий:

`git push origin main`

`git push origin develop`

`git push origin --tags`

В результате в репозитории появились теги релиза и hotfix.

<img width="766" height="639" alt="image" src="https://github.com/user-attachments/assets/3f6c32ca-ab23-4571-8251-a8a105ca2cd8" />


## Итоговое состояние репозитория

После выполнения лабораторной работы в репозитории присутствуют следующие файлы:

- `README.md`;
- `report.md`;
- `bad_file.txt`;
- `check_format.sh`;
- `task_manager.py`;
- `version.txt`;
- `file_with_error.py`.

Также в репозитории присутствуют ветки:

- `main`;
- `develop`;
- `feature-login`.

В процессе работы также создавались временные ветки Git Flow:

- `feature/task-management`;
- `release/v1.0.0`;
- `hotfix/hotfix-1.0.1`.

В репозитории также были созданы теги, связанные с release и hotfix.

## Результаты работы

В ходе выполнения лабораторной работы были выполнены следующие действия:

1. Создан и склонирован репозиторий GitHub.
2. Создан рабочий файл `report.md`.
3. Выполнен первый commit и push в ветку `main`.
4. Создана ветка `feature-login`.
5. Выполнены изменения в ветке `feature-login`.
6. Выполнены изменения в ветке `main`.
7. Смоделирован конфликт слияния.
8. Конфликт был разрешён вручную.
9. Настроен pre-commit hook для проверки `.txt` файлов.
10. Проверена блокировка коммита при неправильном формате `.txt`.
11. Проверен успешный коммит после исправления формата.
12. Установлен и настроен Git Flow.
13. Создана ветка `develop`.
14. Создана и завершена feature-ветка `task-management`.
15. Создан release `v1.0.0`.
16. Создан hotfix `hotfix-1.0.1`.
17. Изменения были отправлены на GitHub.

## Вывод

В результате выполнения лабораторной работы были изучены расширенные возможности Git.

Была выполнена работа с ветками, коммитами, удалённым репозиторием и слияниями. Также был смоделирован конфликт между ветками `main` и `feature-login`, после чего конфликт был разрешён вручную.

Дополнительно был настроен Git Hook `pre-commit`, который автоматически проверяет формат `.txt` файлов перед созданием коммита.

Также был установлен и использован Git Flow. С его помощью были выполнены операции с ветками `develop`, `feature`, `release` и `hotfix`.

Таким образом, лабораторная работа выполнена.
