#
# Skrypt podmieniaj¹cy polskie znaki na niecrashuj¹ce
#

foreach($line in Get-Content .\polskie_znaki.txt) {
    $polskiznak, $znakniecrashujacy = $line.Split(" ");
    Get-ChildItem -recurse ".\Sonic Adventure PL\Misc\*\*\*\English.txt" |
    ForEach-Object {
            $name = $_.fullname; 
            (get-content $name ) | 
            Foreach-Object {
                $_ -replace $polskiznak,$znakniecrashujacy
            } |
            Set-Content $name
    }
}