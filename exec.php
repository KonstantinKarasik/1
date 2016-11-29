<?php
header("Content-Type: text/html; charset=utf-8");
session_start();
$session_id = session_id();
$connect = mysqli_connect("mysql.hostinger.ru", "u957192484_1", "123456", "u957192484_1") or die('No connection to server');
mysqli_query($connect, "SET NAMES utf-8");

//Проверка нажатия кнопки "отправить" и наличия в форме файла
if ($_POST['update'] == 'ok' and strlen($_FILES["filename"]["name"]) > 0) {
    if (copy($_FILES["filename"]["tmp_name"], $path . $_FILES["filename"]["name"])) {
        echo("Файл " . "<b>" . $_FILES["filename"]["name"] . "</b>" . " успешно загружен!<br>");
    }
    $file = fopen('php://memory', 'w+');
    fwrite($file, file_get_contents($_FILES["filename"]["name"]));
    rewind($file);
    $write_row = 0; //количество исправленных строк
    $r = 0; // количество строк в файле
    while (($row = fgetcsv($file)) != FALSE) // Перебираем строки из файла
    {
        $r++;
        if ($r == 1) {
            continue;
        } // Пропускаем первую строчку
        //Удаляем из базы строки с одинаковыми id и user_id
        mysqli_query($connect, "DELETE FROM product WHERE id='$row[0]' AND user_id = '$session_id' ");
        $write_row = $write_row + mysqli_affected_rows($connect);
        //Вставляем строки из файла в базу
        if (strlen($row[4]) == 0) //Заменяем small_text на big_text, если small_text не заполнен
        {
            $row[4] = $row[5];
        }
        $row[4] = strip_tags($row[4]); //Убираем теги
        $row[4] = iconv("UTF-8", "windows-1251", $row[4]); // Меняем кодировку для расчета независимо от языка текста
        if (strlen($row[4]) > 30) {
            $row[4] = substr("$row[4]", 0, 30); //Если символов больше 30, берем первые 30 
            $row[4] = substr($row[4], 0, strrpos($row[4], ' ')); //Берем все символы до последнего пробела, чтобы не разрывать слова   
        }
        $small_text = iconv("windows-1251", "UTF-8", $row[4]); // Меняем кодировку обратно
        mysqli_query($connect, "INSERT INTO product (id, name, name_trans, price, small_text, big_text, user_id) VALUES ('$row[0]','$row[1]', '$row[2]', '$row[3]', '$small_text', '$row[5]', '$session_id')");

    }
    fclose($file);
    $num_table_row = $r - 1;
    $insert_row = $num_table_row - $write_row; //Добавлено
    echo '<title>Результат</title>';
    echo "Добавлено: " . $insert_row . "<br>";
    echo "Обновлено: " . $write_row . "<br>";
    echo '<a href="index.html">Загрузить еще</a>';
}
?>