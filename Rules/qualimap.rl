rule qualimap:
    input:  bam="{x}.dedup.bam",
            bed="exome_targets.bed"
    output: "QC/{x}.qualimapReport","QC/{x}.qualimapReport/genome_results.txt"
    threads: 8
    params: qualimap=config['bin'][pfamily]['QUALIMAP'],organism=config['references'][pfamily]['ORGANISM'],regions="exome_targets.bed",rname="pl:qualimap"
#    shell:  "{params.qualimap} bamqc -bam {input} -c gd {params.organism} -outfile {output} -gff {params.regions} -outformat HTML -nw 500 -p NON-STRAND-SPECIFIC -nt {threads}"
    shell:  "{params.qualimap} bamqc -bam {input.bam} -c gd {params.organism} -outdir {output} -gff {params.regions} -outformat HTML -nw 500 -p NON-STRAND-SPECIFIC"