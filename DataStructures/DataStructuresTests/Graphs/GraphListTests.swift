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
    
    // Create parents
    let roberto = GraphNode<String>(key: "Roberto")
    let josephina = GraphNode<String>(key: "Josephina")
    
    // Kids
    let marcos = GraphNode<String>(key: "Marcos")
    let heffe = GraphNode<String>(key: "Heffe")
    let marcia = GraphNode<String>(key: "Marcia")
    let timbo = GraphNode<String>(key: "Timbo")
    let christos = GraphNode<String>(key: "Christos")
    let eseth = GraphNode<String>(key: "Eseth")
    
    // Grand kids
    let arron = GraphNode<String>(key: "Arron")
    
    let koreo = GraphNode<String>(key: "Koreo")
    let kilo = GraphNode<String>(key: "Kilo")
    
    let chapo = GraphNode<String>(key: "Chapo")
    let macarena = GraphNode<String>(key: "Macarena")
    
    // Great grand kids
    let clara = GraphNode<String>(key: "Clara")
    let colito = GraphNode<String>(key: "Colito")
    
    let roberta = GraphNode<String>(key: "Roberta")
    let laura = GraphNode<String>(key: "Laura")
    
    // Not in the family, but still a good friend.
    let pizzaTheHut = GraphNode<String>(key: "Pizza-The-Hut")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // establish connections between parents
        roberto.adjacents.append(josephina)
        josephina.adjacents.append(roberto)
        
        // .. then their children
        roberto.adjacents.append(contentsOf: [marcos, heffe, marcia, timbo, christos, eseth])
        josephina.adjacents.append(contentsOf: [marcos, heffe, marcia, timbo, christos, eseth])
        
        // should children all be adjacents of one another? probably.
        
        // .. then for the grand children
        marcos.adjacents.append(arron)
        heffe.adjacents.append(contentsOf: [koreo, kilo])
        timbo.adjacents.append(contentsOf: [chapo, macarena])
        
        // ... then for great grand kids
        arron.adjacents.append(contentsOf: [clara, colito])
        
        // should great grand kids be adjacents of one another? probably.
        
        kilo.adjacents.append(contentsOf: [roberta, laura])
        
        graphList.nodes = [roberto, josephina,
                           marcos, heffe, marcia, timbo, christos, eseth,
                           arron, koreo, kilo, chapo, macarena,
                           clara, colito, roberta, laura]
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Depth First Search
    
    func testDFS() {
        XCTAssert(GraphList<String>.depthFirstSearch(root: graphList.nodes.first, for: arron) === arron)
    }
    
    // MARK: - Breadth First Search
    
    func testBFSReturnsNilWhenGraphIsEmpty() {
        XCTAssertNil(GraphList<String>.breadthFirstSearch(from: nil, to: marcia))
    }
    
    func testBFSReturnsNilWhenGraphDoesNotContainKey() {
        XCTAssertNil(GraphList<String>.breadthFirstSearch(from: graphList.nodes.first, to: pizzaTheHut))
    }
    
    func testBFSReturnsKeyWhenGraphContainsKey() {
        XCTAssert(GraphList<String>.breadthFirstSearch(from: graphList.nodes.first, to: marcia) === marcia)
    }
    
    // MARK: - Path exists
    
    func testPathExistsReturnsFalseWhenADoesNotExistInGraph() {
        XCTAssertFalse(GraphList<String>.pathExists(between: pizzaTheHut, and: roberto))
    }
    
    func testPathExistsReturnsFalseWhenBDoesNotExistInGraph() {
        XCTAssertFalse(GraphList<String>.pathExists(between: roberto, and: pizzaTheHut))
    }
    
    func testPathExistsReturnsTrueWhenBothNodesSharePath() {
        XCTAssertTrue(GraphList<String>.pathExists(between: roberto, and: colito))
        XCTAssertTrue(GraphList<String>.pathExists(between: marcos, and: colito))
        XCTAssertTrue(GraphList<String>.pathExists(between: arron, and: colito))
    }
    
    func testPathExistsReturnsFalseWhenBothNodesDoNotSharePath() {
        XCTAssertFalse(GraphList<String>.pathExists(between: arron, and: koreo))
        XCTAssertFalse(GraphList<String>.pathExists(between: kilo, and: clara))
        XCTAssertFalse(GraphList<String>.pathExists(between: chapo, and: colito))
    }
}
