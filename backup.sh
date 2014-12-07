#!/bin/bash
echo -e "\033[33;44m Backing up database...\033[0m"
rsync -avz webdocgr@webdocgraffiti.com.br:~/webdocgraffiti/current/db/webdoc.sqlite3 ~/Projetos/webdocgraffiti/db/webdoc.dev.sqlite3
echo -e "\033[33;44m Backing up uploads...\033[0m"
rsync -ravz webdocgr@webdocgraffiti.com.br:~/webdocgraffiti/shared/system/ ~/Projetos/webdocgraffiti/public/system/
