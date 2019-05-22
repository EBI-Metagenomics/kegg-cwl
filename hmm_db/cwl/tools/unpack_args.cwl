#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: ExpressionTool

label: "Tool to allow the workflow to be called from the command line with a joined list of K### accessions"


requirements:
  InlineJavascriptRequirement: {}

inputs:
  kegg_orthologs:
    type: string[]

outputs:
  kegg_orthologs_clean:
    type: string[]

expression: |
  ${
    var self = inputs.kegg_orthologs;
    console.log(self[0].indexOf(','));
    console.log(self[0].indexOf(',')>-1 ? self[0].split(',') : self);
    return {'kegg_orthologs_clean': self[0].indexOf(',')>-1 ? self[0].split(',') : self};
  }

s:license: "https://www.apache.org/licenses/LICENSE-2.0"
s:copyrightHolder: "EMBL - European Bioinformatics Institute"

$namespaces:
 edam: http://edamontology.org/
 iana: https://www.iana.org/assignments/media-types/
 s: http://schema.org/

$schemas:
 - http://edamontology.org/EDAM_1.16.owl
 - https://schema.org/docs/schema_org_rdfa.html
