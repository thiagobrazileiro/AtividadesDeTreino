<?php

error_reporting(E_ALL & ~E_WARNING & ~E_NOTICE);

echo "\nO processamento está sendo feito, aguarde alguns instantes\n";

process();

function process()
{
    $table = [[
        'NCM', 'Exp_jan', 'Imp_jan', 'Net_jan', 'Exp_fev', 'Imp_fev', 'Net_fev',
        'Exp_mar', 'Imp_mar', 'Net_mar', 'Exp_abr', 'Imp_abr', 'Net_abr',
        'Exp_mai', 'Imp_mai', 'Net_mai', 'Exp_jun', 'Imp_jun', 'Net_jun', 'Exp_jul',
        'Imp_jul', 'Net_jul', 'Exp_ago', 'Imp_ago', 'Net_ago', 'Exp_set', 'Imp_set',
        'Net_set', 'Exp_out', 'Imp_out', 'Net_out', 'Exp_nov', 'Imp_nov', 'Net_nov',
        'Exp_dez', 'Imp_dez', 'Net_dez', 'Exp_total', 'Imp_total', 'Net_total'
    ]];

    $row = 1;
    $fullImpData = array();
    if (($handle = fopen("imp.csv", "r")) !== FALSE) {
        while (($data = fgetcsv($handle, 0, ';')) !== FALSE) {
            if ($row != 1)
                $fullImpData[$data[5]][(int)$data[2]][(int)$data[1]] += (int)$data[10];

            $row++;
        }
        fclose($handle);
    }

    $row = 1;
    $fullExpData = array();
    if (($handle = fopen("exp.csv", "r")) !== FALSE) {
        while (($data = fgetcsv($handle, 0, ';')) !== FALSE) {
            if ($row != 1)
                $fullExpData[$data[5]][(int)$data[2]][(int)$data[1]] += (int)$data[10];

            $row++;
        }
        fclose($handle);
    }

    foreach ($fullImpData as $uf => $ncms) {
        $fp = fopen("results/$uf.csv", 'w');

        $tableByUf = $table;
        foreach ($ncms as $ncm => $months) {
            $valueByMonth = [$ncm];
            $impTotal = 0;
            $expTotal = 0;
            $netTotal = 0;
            for ($i = 1; $i <= 12; $i++) {
                $impValue = $months[$i] ? $months[$i] : 0;
                $impTotal += $impValue;
                $expValue = $fullExpData[$uf][$ncm][$i] ? $fullExpData[$uf][$ncm][$i] : 0;
                $expTotal += $expValue;
                $valueByMonth = array_merge($valueByMonth, [$expValue], [$impValue], [$expValue - $impValue]);
            }
            if ($fullExpData[$uf][$ncm]) {
                unset($fullExpData[$uf][$ncm]);
            }
            $netTotal = $expTotal - $impTotal;
            $valueByMonth = array_merge($valueByMonth, [$expTotal], [$impTotal], [$netTotal]);
            $tableByUf = array_merge($tableByUf, array($valueByMonth));
        }

        foreach ($fullExpData[$uf] as $ncm => $months) {
            $valueByMonth = [$ncm];
            $impTotal = 0;
            $expTotal = 0;
            $netTotal = 0;
            for ($i = 1; $i <= 12; $i++) {
                $expValue = $months[$i] ? $months[$i] : 0;
                $expTotal += $expValue;
                $impValue =  0;
                $impTotal += $impValue;
                $valueByMonth = array_merge($valueByMonth, [$expValue], [$impValue], [$expValue - $impValue]);
            }
            $netTotal = $expTotal - $impTotal;
            $valueByMonth = array_merge($valueByMonth, [$expTotal], [$impTotal], [$netTotal]);
            $tableByUf = array_merge($tableByUf, array($valueByMonth));
        }

        foreach ($tableByUf as $linha) {
            fputcsv($fp, $linha);
        }

        fclose($fp);
    }
}
