#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "HMMER hmmpress"

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: "mgnify/kegg2hmm"
  InitialWorkDirRequirement:
    listing:
      - $(inputs.hmm_file)

baseCommand: [ 'hmmpress' ]

inputs:
  hmm_file:
    type: File
    inputBinding:
      position: 1

outputs:
  hmmdb_h3m:
    type: File
    outputBinding:
      glob: $(inputs.hmm_file.basename + '.h3m')
  hmmdb_h3i:
    type: File
    outputBinding:
      glob: $(inputs.hmm_file.basename + '.h3i')
  hmmdb_h3f:
    type: File
    outputBinding:
      glob: $(inputs.hmm_file.basename + '.h3f')
  hmmdb_h3p:
    type: File
    outputBinding:
      glob: $(inputs.hmm_file.basename + '.h3p')
s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"

$namespaces:
 edam: http://edamontology.org/
 iana: https://www.iana.org/assignments/media-types/
 s: http://schema.org/
