**Social Network Analysis Using Gephi**

Twitter Vaccine-Exemption Conversations — Network Extraction, Cleaning & Visualization

This project applies social network analysis (SNA) techniques to real Twitter data related to vaccine-exemption discussions. The workflow demonstrates skills in data cleaning, network construction, graph theory metrics, and visualization using OpenRefine, Excel, and Gephi.

The raw dataset consisted of tweets and metadata; using multiple data-processing tools, I transformed the dataset into a clean EdgeList representing user-to-user interactions (mentions & retweets), then built and analyzed the network in Gephi.

**Core Workflow**
1. Data Cleaning with OpenRefine

Using OpenRefine, I performed structured transformations to prepare the network:
- Added the missing @ symbol to usernames using a Clojure expression
(str "@" value)
- Extracted all mentioned users from tweet text via a custom split-filter-merge function
- Split multi-valued cells into separate rows to ensure each row represented one edge
- Cleaned invalid or non-user characters (e.g., “:”)
- Reordered and standardized columns (From and To) to form an EdgeList

2. Final Cleaning in Excel

After exporting from OpenRefine:
- Removed empty or invalid edges (rows with no “To” user)
- Saved the final cleaned file as: lab06SNA-new.csv

This produced a functional dataset for network modeling.

3. Building the Network in Gephi

I loaded the EdgeList into Gephi to visualize and analyze the network:
- Network Layouts
- Applied multiple algorithms such as Fruchterman-Reingold and ForceAtlas for graph arrangement 
- Enabled node labels, adjusted gravity, overlap, and spacing
- Tuned node sizes using In-Degree and Out-Degree metrics
- Computed Graph Metrics

Using Gephi’s built-in Stats panel, I calculated key SNA indicators:
- Average Degree
- Network Diameter
- Graph Density
- Modularity (community detection)

**Final Outputs**

Delivered two layouts:
- In-Degree Network Visualization
- Out-Degree Network Visualization

Each visualization highlights different user-interaction patterns and central hubs within the conversation network.
