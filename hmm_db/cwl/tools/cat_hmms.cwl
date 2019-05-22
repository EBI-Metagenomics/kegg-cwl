#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

label: "Combine hmm files"

baseCommand: [ 'cat' ]

inputs:
  hmm_profiles:
    type: File[]
    inputBinding:
      position: 1

outputs:
  merged_hmm:
    type: stdout

stdout: merged.hmm

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"

$namespaces:
 edam: http://edamontology.org/
 iana: https://www.iana.org/assignments/media-types/
 s: http://schema.org/

$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/docs/schema_org_rdfa.html
