//: Playground - noun: a place where people can play

import Foundation

/*
 Route Between Nodes:
 Given a directed graph, design an algorithm to find out whether there is a route between two nodes.
 
 Notes:
 - It is possible for a directed graph to not have a path between node A and node B. Right?
 - Conversely an undirected graph should always have a path between node A and node Be.
 - Must first locate Node A, then determine if there's a path to B.
 - If not, do the reverse? Locate Node B, then determine if there's path to Node A.
 
 Question:
 - Would an adjacency matrix solve this for us?
 - How could we do this with an adjacency list?
 
 How would you define "a route between two nodes"
 - A route exists between A and Be when A has B listed as an adjacent somewhere in its children's dependencies.
 - Could do this by breath-first searching through A's children, until you land on B, and if not, trying again going
 the opposite direction.
 */
