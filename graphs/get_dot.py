import pickle
import networkx as nx
import os

def create_dot(graph, name):
    with open(os.path.join('dots', name + '.dot'), 'w') as dot_file:
        dot_file.write("digraph G {\n"
                       "node [shape=box,style=filled];\n"
                       "edge [len=3,color=grey];\n"
                       "{node [width=.3,height=.3,shape=octagon,style=filled,color=skyblue] ")
        edges = graph[0].edges
        for node in graph[0].nodes:
            dot_file.write(str(node) + ' ')
        dot_file.write('}\n')
        for edge, count in zip(edges, range(len(edges))):
            from_node = edge[0]
            to_node = edge[1]
            number = edge[2]
            label = edges._adjdict[from_node][to_node][number]['label']
            weight = edges._adjdict[from_node][to_node][number]['weight']
            dot_file.write(str(from_node) + ' -> ' + str(to_node) + ' [label="' + label + ' [' + str(weight) + ']"];\n')
        dot_file.write('}')


path_to_graphs = "graphs.pkl"
graph_file = open(path_to_graphs, 'rb')
graphs = pickle.load(graph_file)
for name in graphs:
    create_dot(graphs[name], name)