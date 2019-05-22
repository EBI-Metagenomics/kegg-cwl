# MODIFIED BY Miguel Boland (mdb@ebi.ac.uk) for Docker containerisation
# Changes:
# - make path to KO2FASTA absolute for docker container


.SUFFIXES:
.PRECIOUS: %.hmm

.DEFAULT_GOAL := help

KO2FASTA := /ko2fasta/ko2fasta.py

methanogenesis = K00200 K00201 K00202 K00203 K00319 K00320 K00399 K00400 K00401 K00402 K00440 K00441 K00442 K00443 K00577 K00578 K00579 K00580 K00581 K00582 K00583 K00584 K00672 K01499 K03388 K03389 K03390 K03421 K03422 K11261 K08264 K08265 K14126 K14127 K14128

methyl_methanogenesis = K14080 K04480 K14081 K16177 K16176 K16179 K16178 K14084 K14083

methanofuran_biosynthesis = K09733 K18933 K19793 K06914 K07144 K07072

coenzyme_F430_biosynthesis = K22011 K22012 K21610 K21611 K21612

#
## Aerobic methanotrophy
#
methane_monooxygenase = K10946 K10945 K10944

aerobic_methanotrophy_type_2_serine_pathway = K00600 K08691 K00830 K00049 K00050 K12972 K11529 K01596 K01610 K01595 K00024 K00025 K00026 K08692 K14067 

aerobic_methanotrophy_type_1_rump_pathway = K08093 K08094 K13812 K13831 K00850 K16370 K01622 K01623 K01624 K11645 K16305 K16306 K00615 K00616 K01807 K01808 K01783   

#
## Nitrogen metabolism
#

nitrate_reductases = K02567 K02568 K02569 K02570 K02571 K02572 K02573 K02574  K00370 K00371 K00374 K00373 K00372 K00360

denitrification = $(nitrate_reductases) K02567 K02568 K00368 K15864 K04561 K02305 K00376

nitrogen_fixation = $(addprefix K025, 84 85 86 87 88 89 90 91 92 93 94 95 96 97) K00531

nitrogenase_plus_F430 = K02586 K02587 K02591 K02592 K21611

#
#

ppp = K00616

#
# Carbon fixation
reductive_citrate_cycle = K00169 K00170 K00171 K00172 K03737 K01007 K01006 K01595 K01959 K01960 K01958 K00024 K01676 K01679 K01677 K01678 K00239 K00240 K00241 K00242 K00244 K00245 K00246 K00247 K18556 K18557 K18558 K18559 K18560 K01902 K01903 K00174 K00175 K00177 K00176 K00031 K01681 K01682 K15230 K15231 K15232 K15233 K15234 

three_Hydroxypropionate_bi_cycle = K02160 K01961 K01962 K01963 K14468 K14469 K15052 K05606 K01847 K01848 K01849 K14471 K14472 K00239 K00240 K00241 K01679 K08691 K14449 K14470 K09709

hydroxypropionate_hydroxybutylate_cycle = K01964 K15037 K15036 K15017 K15039 K15018 K15019 K15020 K05606 K01848 K01849 K15038 K15017 K14465 K14466 K18861 K14534 K15016 K00626

dicarboxylate_hydroxybutyrate_cycle = K00169 K00170 K00171 K00172 K01007 K01595 K00024 K01676 K01677 K01678 K00239 K00240 K00241 K18860 K01902 K01903 K15038 K15017 K14465 K14467 K18861 K14534 K15016 K00626

reductive_acetyl_CoA_pathway = K00198 K05299 K15022 K01938 K01491 K00297 K15023 K14138 K00197 K00194

CBB_cycle = K00855 K01601 K01602 K00927 K05298 K00150 K00134 K01623 K01624 K03841 K02446 K11532 K01086 K04041 K00615 K01623 K01624 K01100 K11532 K01086 K00615 K01807 K01808 

#
# Sulfur cycle

sox_pathway = K17222 K17223 K17224 K17225 K17226 K17227

sulfate_reduction = K11180 K11181

chemotaxis = K03409

bacteria_ribosome = K02946 K02906 K02926 K02892 K02886 K02965 K02890 K02982 K02878 K02904 K02961 K02874 K02895 K02931 K02954 K02994 K02933 K02881 K02988 K02907 K02876 K02919 K02952 K02948 K02986 K02879 K02871 K02996 K02992 K02950 K07590 K02935 K02864 K02863 K02867 K02967 K02956 K02916 K02887 K02914 K02939 K02963 K02990 K02888 K02899 K02902 K02913 K02911 K02909 K02897 K02959 K02884 K02968 K02945 K02970 

archaea_ribosome = K02946 K02906 K02930 K02892 K02886 K02965 K02890 K02982 K02904 K02961 K02874 K02895 K02987 K02931 K02954 K02994 K02933 K02912 K02885 K02881 K02988 K02907 K02876 K02952 K02948 K02986 K02883 K02871 K02996 K02992 K02950 K02936 K02979 K02896 K02869 K02864 K02863 K02867 K02967 K02956 K02978 K02929 K02877 K02984 K02991 K02974 K02977 K02962 K02910 K02924 K02866 K02889 K02922 K02921 K02995 K02966 K02927 K02944 K02976 K02975 K02983 K02873 K02917 K02928 K02915 K02875 K02908

#
# Type IV pili
#
typeIV_pili = K02650 K02652 K02653 K02654 K02656 K02666 K02665 K02664 K02663 K02662 K02676 K02671 K02672 K02673 K02674 K02675 K02655

#
# Circadian clock proteins
#
circadian_clock = K08481 K08482 K08480

#
# cytochrome c maturation
#
cytochrome_c_maturation = K02193 K02194 K02195 K02196 K02197 K02198 K02199 K02200 

heme_biosynthesis = K01885 K14163 K02492 K01845 K01698 K01749 K01719 K13542 K13543 K01599 K00228 K02495 K00230 K00231 K01772 K02302 K00589 K02303 K02496 K13542 K13543 K02304 K03794

alternate_heme_biosynthesis =  K22225 K22226 K22227

modules = methanogenesis nitrogen_fixation aerobic_methanotrophy_type_2_serine_pathway aerobic_methanotrophy_type_1_rump_pathway CBB_cycle denitrification methane_monooxygenase ppp reductive_citrate_cycle three_Hydroxypropionate_bi_cycle hydroxypropionate_hydroxybutylate_cycle dicarboxylate_hydroxybutyrate_cycle reductive_acetyl_CoA_pathway sox_pathway chemotaxis bacteria_ribosome archaea_ribosome Wood_Ljungdahl_pathway reductive_citrate_cycle nitrate_reductases sulfate_reduction methanofuran_biosynthesis typeIV_pili circadian_clock methyl_methanogenesis coenzyme_F430_biosynthesis nitrogenase_plus_F430 cytochrome_c_maturation heme_biosynthesis alternate_heme_biosynthesis

help:
	$(info create HMMs for KEGG orthologs and KEGG modules)
	$(info To create a HMM for a single KEGG ortholog run:)
	$(info make <KO>.kegg_muscle_aligned.hmm (eg. K00399.kegg_muscle_aligned.hmm))
	$(info To make HMMs from a KEGG module run:)
	$(info make kegg_modules/<M>/models.hmm.h3p (eg. make kegg_modules/M00001/models.hmm.h3p))
	$(info This will download all of the kegg orthologs for the module)
	$(info make HMMs for them and use hmmpress to create a database for searching)


external_dependancies := hmmpress hmmbuild muscle cd-hit perl python3

check_dependancies:
	@for i in $(external_dependancies); do which $$i &>/dev/null; if [ ! $$? -eq 0 ]; then echo "could not find $$i in your path. you probably don't have it installed/loaded correctly"; exit 1;fi  done

default: $(addprefix manual_modules/,$(addsuffix /models.hmm.h3m, $(modules)))

# get list of all modules
module_listing.tsv:
	curl 'http://rest.kegg.jp/list/module' > $@


%.kegg.faa: check_dependancies
	python3 ${KO2FASTA} -o $@ $*
	count=$$(grep -c '^>' $@); \
	if [ $$count -ge 1000 ]; then \
		cd-hit -i $@ -o $@.repset -c 0.6 -n 4 && mv $@.repset $@;\
	elif [ $$count -ge 500 ]; then \
		cd-hit -i $@ -o $@.repset -c 0.85 && mv $@.repset $@; \
	fi

%.kegg_muscle_aligned.faa: %.kegg.faa
	muscle -in $< -out $@

%.kegg_muscle_aligned.hmm: %.kegg_muscle_aligned.faa
	hmmbuild $*.tmp.hmm $<
	(head -n 1 $*.tmp.hmm && curl http://rest.kegg.jp/find/ko/$* | perl -pe 's/ko:(\w+)\s+(.+);\s+(.*)/NAME  $$2\nACC   $$1\nDESC  $$3/' && tail -n +3 $*.tmp.hmm) > $@
	rm $*.tmp.hmm

%.hmm.h3f %.hmm.h3m %.hmm.h3i %.hmm.h3p: %.hmm
	-rm $<.*
	hmmpress $<


.SECONDEXPANSION:
kegg_modules/%/models.hmm: $$(addsuffix .kegg_muscle_aligned.hmm, $$(shell curl -s 'rest.kegg.jp/link/ko/$$*' | cut -f 2 | sed 's/ko.//'))
	-mkdir $(@D)
	cat $^ > $@
manual_modules/%/models.hmm: $$(addsuffix .kegg_muscle_aligned.hmm, $$($$*))
	-mkdir $(@D)
	cat $^ > $@

