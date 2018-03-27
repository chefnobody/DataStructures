//
//  Graph.swift
//  DataStructures
//
//  Created by Aaron Connolly on 3/1/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class GraphNode<T: Comparable> {
    
    // MARK: - Public properties
    
    public var adjacents: [GraphNode<T>]
    public var visited: Bool
    
    var key: T
    
    public init(key: T) {
        self.key = key
        self.adjacents = [GraphNode<T>]()
        self.visited = false
    }
    
    // MARK: - Comparable ... ?
}

/*
 A graph as an ajacency list.
 - This wrapper class may not always be necessary or helpful.
 */
public class GraphList<T: Comparable> {
    public var nodes: [GraphNode<T>]
    
    public init() {
        self.nodes = [GraphNode<T>]()
    }
    
    // This is slightly odd, perhaps that we search for keys but return nodes.
    public static func depthFirstSearch(root: GraphNode<T>?, for target: GraphNode<T>?) -> GraphNode<T>? {
        guard let node = root else { return nil }
        
        print(node.key)
        node.visited = true
        
        if node === target {
            return node
        }
        
        for child in node.adjacents {
            if !child.visited {
                return depthFirstSearch(root: child, for: target)
            }
        }
        
        return nil
    }
    
    /*
     Pro-tips:
       - Use a Queue to manage the nodes you've visited
       - Recursion not necessary.
     */
    
    public static func breadthFirstSearch(from root: GraphNode<T>?, to target: GraphNode<T>?) -> GraphNode<T>? {
        guard let root = root else { return nil }
        
        let queue = Queue<GraphNode<T>>()
        root.visited = true
        queue.enQueue(key: root)
        
        while !queue.isEmpty() {
            // safe because the queue is _not_ empty at this point.
            let node = queue.deQueue()!
            
            // Did we land on our key?
            if node === target {
                return node
            }
            
            // Iterate over child nodes marking and adding to queue.
            for child in node.adjacents {
                if child.visited == false {
                    child.visited = true
                    queue.enQueue(key: child)
                }
            }
        }
        
        return nil
    }
    
    public static func pathExists(between a:GraphNode<T>, and b:GraphNode<T>) -> Bool {
        return breadthFirstSearch(from: a, to: b) != nil ? true : false
    }
}
