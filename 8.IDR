# sort peak file by p-value
sort -k8,8nr peaks.broadPeak > pval_sorted/peaks.broadPeak

#IDR analysis
idr --samples 1_peaks.broadPeak 2_peaks.broadPeak --input-file-type broadPeak --rank p.value --output-file idr.txt --plot --log-output-file idr.log --verbose
