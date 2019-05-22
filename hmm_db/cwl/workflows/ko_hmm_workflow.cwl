class: Workflow
cwlVersion: v1.0

requirements:
  MultipleInputFeatureRequirement: {}
  InlineJavascriptRequirement: {}
  ScatterFeatureRequirement: {}

inputs:
  ko_s:
    type: string[]

outputs:
  ko_hmms:
    type: File[]
    outputSource: ko2hmm/kegg_hmm
  merged_hmm:
    type: File
    outputSource: cat_hmms/merged_hmm
  hmm_db_h3m:
    type: File
    outputSource: hmmpress/hmmdb_h3m
  hmm_db_h3i:
    type: File
    outputSource: hmmpress/hmmdb_h3i
  hmm_db_h3f:
    type: File
    outputSource: hmmpress/hmmdb_h3f
  hmm_db_h3p:
    type: File
    outputSource: hmmpress/hmmdb_h3p
steps:
  ko2hmm:
    scatter: kegg_ortholog
    in:
      kegg_ortholog:
        source: ko_s
    out:
      - kegg_hmm
    run: ../tools/ko_hmm.cwl
    label: 'ko2fasta: build an HMM for a given kegg ortholog'

  cat_hmms:
    in:
      hmm_profiles: ko2hmm/kegg_hmm
    out:
      - merged_hmm
    run: ../tools/cat_hmms.cwl

  hmmpress:
    in:
      hmm_file: cat_hmms/merged_hmm
    out:
      - hmmdb_h3m
      - hmmdb_h3i
      - hmmdb_h3f
      - hmmdb_h3p
    run: ../tools/hmmpress.cwl
$schemas:
  - 'http://edamontology.org/EDAM_1.16.owl'
  - 'https://schema.org/docs/schema_org_rdfa.html'

$namespaces:
  edam: 'http://edamontology.org/'
  iana: 'https://www.iana.org/assignments/media-types/'
  s: 'http://schema.org/'

's:copyrightHolder': EMBL - European Bioinformatics Institute
's:license': 'https://www.apache.org/licenses/LICENSE-2.0'

# export TMP=$PWD/tmp; cwltoil --user-space-docker-cmd=docker --debug --outdir $PWD/out --logFile $PWD/log  --workDir $PWD/tmp_toil --retryCount 0 cwl/metaspades_pipeline.cwl cwl/metaspades_pipeline.yml