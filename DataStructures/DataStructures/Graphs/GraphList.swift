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
    
    public func depthFirstSearch(root: GraphNode<T>?) {
        guard let node = root else { return }
        
        print(node.key)
        node.visited = true
        
        for child in node.adjacents {
            if !child.visited {
                depthFirstSearch(root: child)
            }
        }
    }
    
    /*
     Pro-tips:
       - Use a Queue to manage the nodes you've visited
       - Recursion not necessary.
     */
    public func breadthFirstSearch(from root: GraphNode<T>?, for key: T) -> T? {
        guard let root = root else { return nil }
        
        let queue = Queue<GraphNode<T>>()
        root.visited = true
        queue.enQueue(key: root)
        
        while !queue.isEmpty() {
            // safe because the queue is _not_ empty at this point.
            let node = queue.deQueue()!
            
            // Did we land on our key?
            if node.key == key {
                return key
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
    
    public func pathExists(between a:T, and b:T) -> Bool {
        return false
    }
}
