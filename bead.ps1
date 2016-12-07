$tabla = New-Object 'object[,]' 8,8
$soronbelul= @()
$i=0
foreach ($line in [System.IO.File]::ReadLines("be1.txt")) {
  For ($j = 0; $j -lt 8; ++$j)
  {
    $tabla[$i,$j]=$line.Split(" ")[$j]
  }
  ++$i
}
$jo=$TRUE;
#soronkent ell
For ($i = 0; $i -lt 8; ++$i)
{
  $n=0
  For ($j = 0; $j -lt 8; ++$j)
  {
    $n+=$tabla[$i,$j]
  }
  $jo=$jo -and ($n -eq 1)
}
#oszloponkent
For ($i = 0; $i -lt 8; ++$i)
{
  $n=0
  For ($j = 0; $j -lt 8; ++$j)
  {
    $n+=$tabla[$j,$i]
  }
  $jo=$jo -and ($n -eq 1)
}
#balrol atlosan
For ($t = 0; $t -lt 16; ++$t)
{
  $n=0
  $j=0
  For ($i = $t; $i -ge 0; --$i)
  {
    If (($i -lt 8) -and ($j -lt 8))
    {
      $n+=$tabla[$j,$i]
    }
    ++$j
  }
  $jo=$jo -and ($n -le 1)
}
$jo
