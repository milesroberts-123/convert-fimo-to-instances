#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

fimo = read.delim(args[1], sep = "\t", header = T, colClasses = c("character", "character", "character", "numeric", "numeric", "character", "numeric", "numeric", "numeric", "character"))
fimo = fimo[order(fimo$motif_id, fimo$p.value, fimo$sequence_name, fimo$start),]

#Remove extraneous columns
fimo = fimo[,c("motif_id", "sequence_name", "start", "stop", "strand", "matched_sequence")]

result = NULL

#Extract only columns necessary for minimal PWM format, add X to end of column names and remove special characters to
#prevent MotifSuite tools from getting confused
for(id in unique(fimo$motif_id)){
	motif = fimo[which(fimo$motif_id == id),c("sequence_name", "start", "stop", "strand", "matched_sequence")]
	idrow = c(paste("#id: ", gsub("_|-", "", id), "X", sep = ""), "", "", "", "", "")
	result = rbind(idrow, motif, result)
}

#If any warnings pop up print them
warnings()

#Add file header, save as .txt to be compatible with FuzzyClustering
write.table("#INCLUSive GFF File", args[2], quote = F, col.names = F, row.names = F, sep = "\t")
write.table(result, args[2], quote = F, col.names = F, row.names = F, sep = "\t", append = T)

