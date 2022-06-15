bedops --everything $(cat bed_list.txt) > tissue_combine.bed
bedtools sort -i tissue_combine.bed > tissue_combine_sort.bed
bedtools merge -i tissue_combine_sort.bed -c 1,5 -o count,mean > tissue_union.bed
