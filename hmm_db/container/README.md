# Building HMMs from KEGG data
Using the KEGG REST API it's possible to download genes corresponding
to KEGG orthologs, align them and build HMMs from the alignment. This
process is implemented as a Makefile that allows for efficient and
parallel processing. It is also possible to bulk download and build all
of the HMMs for specific KEGG modules.

#### Dependencies
* [muscle](https://www.drive5.com/muscle/)
* [hmmer](http://hmmer.org)
* [cd-hit](https://github.com/weizhongli/cdhit/releases)
* [python3](https://www.python.org/) (probably already installed on your system)
* [python-requests](http://docs.python-requests.org/en/master/): A library for python that will need to be installed
* [perl](http://www.perl.org/) (probably already installed on your system)

#### Create a HMM for a KEGG ortholog
```
make K00399.kegg_muscle_aligned.hmm
```

#### Create a HMM database for a KEGG module
```
make kegg_modules/M00001/models.hmm.h3p
```

#### Get a list of all KEGG mdules
```
make module_listing.tsv
```
