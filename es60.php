<?php

$cod = "RSSMRA56D12F205";
$s = 0;

for ($i = 0; $i < strlen($cod); $i++) {
    $ch = chr($cod{$i});

    if ($ch >= 48 && $ch <= 57)
        $s += $ch - 48;
    else
        $s += $ch - 41;
}

?>
