#!/bin/bash

echo "---------------------test 3 два файла с дописыванием в существующие и полная статистика---------------------------"

# Определение названий файлов
INPUT_FILES=("in1.txt" "in2.txt")
OUTPUT_FILES=("floats.txt" "strings.txt" "integers.txt")
ETALONS_OUTPUT_FILES=("et_floats.txt" "et_strings.txt" "et_integers.txt")

# Проверка наличия пути к JAR-файлу
if [ -z "$1" ]; then
  echo "Не задан путь к jar файлу"
  exit 1
fi

# Определение полного пути к JAR-файлу
JAR_PATH="$(cd "$(dirname "$1")" && pwd)/$(basename "$1")"

SCRIPT_DIR=$(dirname "$0")
cd "$SCRIPT_DIR" || { echo "Не удалось перейти в директорию $SCRIPT_DIR"; exit 1; }


# Запуск JAR-файла
echo "Запуск java -jar $JAR_PATH -a -f ${INPUT_FILES[*]}"
java -jar "$JAR_PATH" -a -f "${INPUT_FILES[@]}"
if [ $? -ne 0 ]; then
  echo "Ошибка при выполнении JAR-файла"
  exit 1
fi


# Сравнение файлов
for i in "${!OUTPUT_FILES[@]}"; do
  if [ -f "${OUTPUT_FILES[$i]}" ] && [ -f "${ETALONS_OUTPUT_FILES[$i]}" ]; then
    if diff -q -B "${OUTPUT_FILES[$i]}" "${ETALONS_OUTPUT_FILES[$i]}" > /dev/null; then
      echo "Файл ${OUTPUT_FILES[$i]} совпадает с эталоном ${ETALONS_OUTPUT_FILES[$i]}"
    else
      echo "Файл ${OUTPUT_FILES[$i]} отличается от эталона ${ETALONS_OUTPUT_FILES[$i]}"
      diff -B -y -N "${OUTPUT_FILES[$i]}" "${ETALONS_OUTPUT_FILES[$i]}"
    fi
  else
    echo "Один из файлов ${OUTPUT_FILES[$i]} или ${ETALONS_OUTPUT_FILES[$i]} отсутствует"
  fi
done