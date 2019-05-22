#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "KEGG Ortholog HMM generator"

hints:
  SoftwareRequirement:
    packages:
      spades:
        specs: [ "https://identifiers.org/rrid/RRID:SCR_000131" ]
        version: [ "3.12.0" ]

requirements:
  InlineJavascriptRequirement: {}
  DockerRequirement:
    dockerPull: "mgnify/kegg2hmm"

baseCommand: [ 'make', '-f' ,'/ko2fasta/Makefile' ]


inputs:
  kegg_ortholog:
    type: string
    inputBinding:
      position: 1
      valueFrom: |
        ${
          return self + '.kegg_muscle_aligned.hmm'
        }

outputs:
  kegg_hmm:
    type: File
    outputBinding:
      glob: $(inputs.kegg_ortholog + '.kegg_muscle_aligned.hmm')

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"

$namespaces:
 edam: http://edamontology.org/
 iana: https://www.iana.org/assignments/media-types/
 s: http://schema.org/
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/docs/schema_org_rdfa.html
