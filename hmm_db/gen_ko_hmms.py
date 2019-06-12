import requests
import re
import argparse
from subprocess import check_output
import os

kegg_id_re = re.compile(r'.+(K\d+)\t.+')

dirname = os.path.abspath(os.path.dirname(__file__))
VENV = os.path.abspath(os.path.join(dirname, os.pardir, 'venv', 'bin', 'activate'))

MAKEFILE = os.path.join(dirname, 'Makefile')

OUT_DIR = os.path.join(dirname, 'out')

MERGED_HMM = None

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('-o', '--outdir')
    parser.add_argument('-k', '--kegg-ids', nargs='*')
    parser.add_argument('--lsf', help='Run make commands as LSF jobs rather than in current shell', action='store_true')
    parser.add_argument('--hmmpress', help='Combine hmms in outdir to output folder', action='store_true')
    return parser.parse_args()


class GenKoHmms:
    def __init__(self):
        self.args = parse_args()
        self.output_dir = self.args.outdir or OUT_DIR
        os.makedirs(self.output_dir, exist_ok=True)

        kegg_ids = self.args.kegg_ids or self.fetch_kegg_ortholog_list()
        print('Building {} kegg orthologs...'.format(len(kegg_ids)))

        if not self.args.hmmpress:
            for kegg_id in kegg_ids:
                self.build_hmmdb(kegg_id)
        else:
            merged_hmm = os.path.join(self.output_dir, 'merged.hmm')
            self.merge_hmms(merged_hmm)
            self.press_hmms(merged_hmm)

    @staticmethod
    def fetch_kegg_ortholog_list():
        print('Fetching kegg ortholog list...')
        req = requests.get('http://rest.kegg.jp/list/ko')
        resp = req.content.decode('UTF-8')
        print('Fetched list')
        lines = list(filter(len, resp.split('\n')))
        kegg_ids = [kegg_id_re.findall(l)[0] for l in lines]
        return kegg_ids

    def build_hmmdb(self, kegg_id):
        log_file = os.path.join(self.output_dir, kegg_id + '.log')
        if os.path.exists(os.path.join(self.output_dir, kegg_id + '.kegg_muscle_aligned.hmm')):
            print(f'{kegg_id} hmm already exists.')
            return

        if os.path.exists(log_file):
            os.remove(log_file)

        cmd = f'source {VENV} && cd {self.output_dir} && make -f {MAKEFILE} {kegg_id}.kegg_muscle_aligned.hmm'
        out = check_output(f'bsub -g /kegg -o {log_file} "{cmd}"', shell=True)
        print(out)

    def merge_hmms(self, merged_hmm):
        cmd = f'find {self.output_dir} -type f -name *aligned.hmm -exec cat {{}} >> {merged_hmm}\;'
        out = check_output(cmd, shell=True)

    # def press_hmms(self, ):
        




if __name__ == '__main__':
    GenKoHmms()
