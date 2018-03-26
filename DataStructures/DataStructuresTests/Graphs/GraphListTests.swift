//
//  GraphTests.swift
//  DataStructuresTests
//
//  Created by Aaron Connolly on 3/1/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import XCTest
import DataStructures

class GraphListTests: XCTestCase {

    let graphList = GraphList<String>()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // Create parents
        let r = GraphNode<String>(key: "Robert")
        let j = GraphNode<String>(key: "Joanne")
        
        // Kids
        let m = GraphNode<String>(key: "Marc")
        let je = GraphNode<String>(key: "Jeff")
        let ma = GraphNode<String>(key: "Marcie")
        let t = GraphNode<String>(key: "Tim")
        let c = GraphNode<String>(key: "Christopher")
        let s = GraphNode<String>(key: "Seth")
        
        // Grand kids
        let a = GraphNode<String>(key: "Aaron")
        
        let k = GraphNode<String>(key: "Korey")
        let ky = GraphNode<String>(key: "Kyle")
        
        let ch = GraphNode<String>(key: "Chase")
        let mac = GraphNode<String>(key: "MacKenzie")
        
        // Great grand kids
        let cl = GraphNode<String>(key: "Claire")
        let co = GraphNode<String>(key: "Cole")
        
        let ro = GraphNode<String>(key: "Rowan")
        let l = GraphNode<String>(key: "Leighton")
        
        // establish connections between parents
        r.adjacents.append(j)
        j.adjacents.append(r)
        
        // .. then their children
        r.adjacents.append(contentsOf: [m, je, ma, t, c, s])
        j.adjacents.append(contentsOf: [m, je, ma, t, c, s])
        
        
        // should children all be adjacents of one another? probably.
        
        // .. then for the grand children
        m.adjacents.append(a)
        j.adjacents.append(contentsOf: [k, ky])
        t.adjacents.append(contentsOf: [ch, mac])
        
        // ... then for great grand kids
        a.adjacents.append(contentsOf: [cl, co])
        
        // should great grand kids be adjacents of one another? probably.
        
        ky.adjacents.append(contentsOf: [ro, l])
        
        graphList.nodes = [r, j, m, je, ma, t, c, s, a, k, ky, ch, mac, cl, co, ro, l]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDFS() {
        graphList.depthFirstSearch(root: graphList.nodes.first)
    }
    
    func testBFS() {
        graphList.breadthFirstSearch(root: graphList.nodes.first)
    }
}
