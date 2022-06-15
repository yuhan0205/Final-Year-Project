bedtools intersect -a sorted_blood_all_peaks.bed -b sorted_pan_cancer_hg19.bed -v > blood_minus_cancer.bed
bedtools intersect -a blood_minus_cancer.bed -b sorted_filtered_tissue_hg19.bed -v > blood_minus_cancer_minus_tissue.bed

bedtools intersect -a sorted_COAD_hg19_filtered.bed -b sorted_blood_all_peaks.bed -v > COAD_minus_blood.bed
bedtools intersect -a COAD_minus_blood.bed -b sorted_filtered_tissue_hg19.bed -v > COAD_minus_blood_minus_tissue.bed
