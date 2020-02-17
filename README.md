# kegg-cwl


### Prepare files from KEGG
```bash
# download list of all pathways
curl -s http://rest.kegg.jp/list/module | cut -f1 | cut -c 4- > pathways/list_pathways.txt

# get DEFINITION file with pathway from KEGG file (saving in format: <name:pathway>)
cat pathways/list_pathways.txt | while read line; do echo "$line:" && curl -s http://rest.kegg.jp/get/$line | grep ^DEFINITION | cut -c 13-; done |  sed -z 's|:\n|:|g' > pathways/all_pathways.txt
# !!! TODO make sure that each pathway has only KO-s but not other MO-s
```
