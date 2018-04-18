#
# Skrypt podmieniaj¹cy polskie znaki na niecrashuj¹ce
#

foreach($line in Get-Content .\polskie_znaki.txt) {
    $polskiznak, $znakniecrashujacy = $line.Split(" ");
    Get-ChildItem -recurse -path ".\Sonic Adventure PL\Misc\" -Include *.txt, *.ini |
    ForEach-Object {
            $name = $_.fullname;
            echo $name; 
            (get-content $name ) | 
            Foreach-Object {
                $_ -ireplace $polskiznak,$znakniecrashujacy
            } |
            Set-Content $name
    }
}