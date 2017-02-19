function tex2pdf  --description 'with cygwin'
  if [ (count $argv) = 0 ];
    echo 'Set an argument!'
    return 1
  end
  platex   $argv.tex   # create dvi file
  dvipdfmx $argv.dvi   # create pdf file
  open     $argv.pdf
end
