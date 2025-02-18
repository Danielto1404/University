#!/bin/bash

at -f i.sh now + 1 minute
tail -n 0 -f ~/report

# При использовании конструкции tail -f считывание из файла будет
# происходить только в случае добавления информации в этот файл. При этом ключ
# -n 0 предотвращает чтение из файла, пока его содержимое не обновилось после запуска команды tail.
