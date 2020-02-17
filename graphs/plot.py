import subprocess

def plot_graph(name):

    #pos = nx.spring_layout(G)
    #write_dot(G, name_graph + '.dot')
    bashCommand = "neato -T png dots/{n}.dot > png/{n}.png".format(n=name)
    subprocess.Popen(bashCommand, stdout=subprocess.PIPE, shell=True)

list_pathways = '/Users/kates/Desktop/EBI/CWL/kegg-cwl/pathways/list_pathways.txt'
with open(list_pathways, 'r') as file_pathways:
    for line in file_pathways:
        plot_graph(line.strip())