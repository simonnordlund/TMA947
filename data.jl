# Data constants from the project PDF

# Useful constants
const N = 11;

# Generator capacities (Unsure if needed)
capacities = [3271,  2190, 1450, 977, 662, 599, 579, 520, 486, 481, 446, 327, 306, 300];

# All available edges
const edges = [(1, 2), (1, 11), (2, 3), (2, 11), (3, 4), (3, 9), (4, 5), (5, 6), (5, 8), (6, 7), (7, 8), (7, 9), (8, 9), (9, 10), (10, 11)];

# Adjacency matrix
const adjacency = [(min(c,r),max(c,r)) in edges ? 1 : 0 for r=1:N, c=1:N ];

# Impedance constants
b = [-20.1, -22.3, -16.8, -17.2, -11.7, -19.4, -10.8, -12.3, -9.2, -13.9, -8.7, -11.3, -7.7, -13.5, -26.7];
g = [4.12, 5.67, 2.41, 2.78, 1.98, 3.23, 1.59, 1.71, 1.26, 1.11, 1.32, 2.01, 4.41, 2.14, 5.06];

# Lookup table for (k,l) -> b_kl
bdict = Dict(edges .=> b);

# Lookup table for (k,l) -> g_kl
gdict = Dict(edges .=> g);


# Cost for each generator
G_costs = [175, 100, 150, 150, 300, 350, 400, 300, 200];

# Max Capacity in Pu
G_maxPu = [0.02, 0.15, 0.08, 0.07, 0.04, 0.17, 0.17, 0.26, 0.05];

# Location for each generator
G_locations = [2, 2, 2, 3, 4, 5, 7, 9, 9];


# Location for each consumer
C_locations = [1, 4, 6, 8, 9, 10, 11];

# Demand for each consumer
C_demand = [0.10, 0.19, 0.11, 0.09, 0.21, 0.05, 0.04];

# List of edges from/to node n
edgesToNode(n::Integer) = [(v1,v2) for (v1,v2) in edges if v1 == n || v2 == n];

# List of connected nodes from node n
connectsTo(n::Integer) = [n == a1 ? a2 : a1 for (a1,a2) in edgesToNode(n)];