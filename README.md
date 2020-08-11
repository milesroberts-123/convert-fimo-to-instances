# convert-fimo-to-instances
Take the list of motif occurrences output by [FIMO](http://meme-suite.org/tools/fimo) (a MEME suite tool) and convert it into the [instances format](http://bioinformatics.intec.ugent.be/MotifSuite/instancesformat.php) used by MotifSuite tools.

## USAGE

There are two arguements to this script, the first is an input file that has the same format as this example [FIMO tsv output](http://meme-suite.org/doc/examples/fimo_example_output_files/fimo.tsv) and the second is the name of the output file, which will contain the instances-formatted list of motif occurences. For example:

`Rscript --vanilla fimo_to_instances.R fimo_example.tsv fimo_example_instances.txt`

this will take the individual motif occurences listed in fimo_example.tsv and convert them into a minimal instances format that can be accepted by MotifSuite tools such as [FuzzyClustering](http://bioinformatics.intec.ugent.be/MotifSuite/fuzzyclustering.php).
 
The output of this script was designed to next be input into FuzzyClustering, which will combine similar motifs.

## DEPENDENCIES

I tested this script with an output of FIMO in MEME suite V5.1.1 and with MotifSuite V1.4. I used R 3.6 when I built the script.
