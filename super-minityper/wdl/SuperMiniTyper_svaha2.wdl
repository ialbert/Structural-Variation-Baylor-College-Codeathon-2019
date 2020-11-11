task SuperMiniTyper_svaha2 {
  File inputFA
  File inputVCF
  Int diskGB = 32
  Int maxNodeLength = 32

  String outbase = basename(inputFA, "fa") + "." + basename(inputVCF, ".vcf")

  command {
     svaha2 -r ${inputFA} -v ${inputVCF} -m ${maxNodeLength} > ${outbase}.gfa
  }

  runtime {
     docker: "ncbicodeathons/superminityper:0.1-cpu"
     cpu : 1
     memory : "24 GB"
     preemptible : 2
     disks : "local-disk " + diskGB + " SSD"
  }

  output{
   File outputGFA = "${outbase}.gfa"
  }
}
