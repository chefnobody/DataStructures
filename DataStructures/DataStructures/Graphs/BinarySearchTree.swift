//
//  Tree.swift
//  DataStructures
//
//  Created by Aaron Connolly on 2/28/18.
//  Copyright © 2018 Top Turn Software. All rights reserved.
//

import Foundation

public class BSTNode<T: Comparable>: CustomStringConvertible {
    
    // MARK: - Custom String Convertible Conformance
    
    public var description: String {
        return String(describing: key)
    }
    
    public var key: T
    public var left: BSTNode<T>?
    public var right: BSTNode<T>?
    public var parent: BSTNode<T>?
    
    public init (key: T) {
        self.key = key
        self.left = nil
        self.right = nil
        self.parent = nil
    }
}

extension BSTNode: Comparable {
    public static func <(lhs: BSTNode<T>, rhs: BSTNode<T>) -> Bool {
        return lhs.key < rhs.key
    }
    
    public static func ==(lhs: BSTNode<T>, rhs: BSTNode<T>) -> Bool {
        return lhs.key == rhs.key
    }
    
    
}

// A Binary Search Tree
// All Left Descendents <= N < All Right Descendants
// where N is the key at a given Node.
//
// - Always ordered
// - Always balanced

public class BST<T: Comparable> {
    
    // MARK: - Tree Preparation
    
    static public func prepareTree(with items: inout [T]) -> BSTNode<T>? {
        // Setting up a tree is weird.
        
        // Remove first item in numbers, add to tree.
        let i = items.remove(at: 0)
        let root: BSTNode<T>? = BST.insert(root: nil, key: i)
        
        // Iterate over remaining nums building out the tree.
        for i in items {
            BST.insert(root: root, key: i)
        }
        
        return root
    }
    
    // MARK: - Determine Height
    
    static public func height(root: BSTNode<T>?) -> Int {
        
        // Base case for an empty tree.
        guard let node = root else {
            return 0
        }
        
        // keep a queue of all nodes at a given level.
        var height = 0
        let queue = Queue<BSTNode<T>>()
        queue.enQueue(key: node)
        
        while true {
            // Be sure to kick-out of this loop
            // when we run out of nodes in the queue
            
            // Keep a separate variable for count of the queue size.
            var nodeCount = queue.count
            
            if nodeCount == 0 {
                // Node count will be 0
                // when the queue is totally empty
                return height
            }
            
            // Incrementing the height means we've queued up
            // another set of nodes at a new level.
            height += 1
            
            // Queue up all the nodes in the tree.
            // Will kick out of this inner while loop
            // node count (which is fixed above) drops to 0.
            // This means we've dequeued all the nodes
            // that were previously enqueued in previous
            // passes through this inner while loop.
            while nodeCount > 0 {
                
                // Remove next node from queue.
                let nextNode: BSTNode<T>? = queue.deQueue()
                
                // Fills the queue with all nodes at this level.
                
                // Enqueue left node if it exists.
                if let left = nextNode?.left {
                    queue.enQueue(key: left)
                }
                
                // Enqueue right node if it exists.
                if let right = nextNode?.right {
                    queue.enQueue(key: right)
                }
                
                nodeCount -= 1
            }
        }        
    }
    
    // MARK: - Creation
    
    static public func createMinimalBST(from numbers: [Int]) -> BSTNode<Int>? {
        
        // Ensure the numbers are sorted.
        let sorted = numbers.sorted()
        
        return createMinimalBST(from: sorted, startIndex: 0, endIndex: numbers.count - 1)
    }
    
    static private func createMinimalBST(from numbers: [Int], startIndex: Int, endIndex: Int) -> BSTNode<Int>? {
        
        if endIndex < startIndex {
            return nil
        }
        
        let middle = (startIndex + endIndex) / 2
        let node = BSTNode<Int>(key: numbers[middle])
        node.left = createMinimalBST(from: numbers, startIndex: startIndex, endIndex: middle - 1)       // left half of array
        node.right = createMinimalBST(from: numbers, startIndex: middle + 1, endIndex: endIndex)        // right half of array
        return node
    }
    
    // MARK: - Insertion
    
    // Finds the right place for this key to hang in the tree.
    @discardableResult static public func insert(root: BSTNode<T>?, key: T) -> BSTNode<T>? {
    
        guard let node = root else {
            // Root is nil so, we hit an empty spot recursing to our spot.
            // return new node.
            return BSTNode<T>(key: key)
        }
        
        // root is not nil
        if key < node.key {
            // recurse left if key is less than current node.
            node.left = insert(root: node.left, key: key)
            
        } else {
            // otherwise recurse right.
            node.right = insert(root: node.right, key: key)
        }
        
        return node
    }
    
    // MARK: - Traversing
    
    static public func inOrderTraverse(node: BSTNode<T>?) {
        guard let node = node else { return }
        
        inOrderTraverse(node: node.left)
        print(node.key)
        inOrderTraverse(node: node.right)
    }
    
    static public func preOrderTraverse(node: BSTNode<T>?) {
        guard let node = node else { return }

        print(node.key)
        preOrderTraverse(node: node.left)
        preOrderTraverse(node: node.right)
    }
    
    static public func postOrderTraverse(node: BSTNode<T>?) {
        guard let node = node else { return }
        
        postOrderTraverse(node: node.left)
        postOrderTraverse(node: node.right)
        print(node.key)
    }
    
    // MARK: - Display
    
    // Pretty prints a binary tree.
    // Think of the tree as stored in an array (this is how a heap works):
    // https://en.wikipedia.org/wiki/Binary_heap#Heap_implementation
    // - Array stores tree in breadth first order. [Parent, Left Child, Right Child, ...],
    // - How would you find the place in the array for a given level and then which is the left and which is the right node at that level?
    static public func prettyPrint(root: BSTNode<T>?) -> String {
        
        guard let node = root else {
            return "Tree is Empty"
        }
        
        var pretty = String()
        
        // Main height of tree.
        let _ = BST<T>.height(root: node)

        // Use queues to walk through each level (similar to finding height)
        var level = 0
        
        let queue = Queue<BSTNode<T>>()
        queue.enQueue(key: node)
        
        while true {
            // Be sure to kick-out of this loop
            // when we run out of nodes in the queue
            
            // Keep a separate variable for count of the queue size.
            var nodeCount = queue.count
            
            if nodeCount == 0 {
                // Node count will be 0
                // when the queue is totally empty
                break
            }
            
            // Skip adding slashes for now.
            pretty += "\n"
            level += 1
            
            while nodeCount > 0 {
            
                // Remove next node from queue.
                let nextNode: BSTNode<T>? = queue.deQueue()
            
                // Enqueue left node if it exists.
                if let left = nextNode?.left {
                    queue.enQueue(key: left)
                }
                
                // Enqueue right node if it exists.
                if let right = nextNode?.right {
                    queue.enQueue(key: right)
                }
                
                nodeCount -= 1
            }
        }

        return "pizza"
    }
    
    // Creates line with node value inserted in the string.
    static public func createLine(for level: Int, nodes: [BSTNode<T>?], totalHeight: Int) -> String {
        
        guard level <= totalHeight else {
            return "Can't do that."
        }
        
        guard nodes.count > 0 else {
            return "Can't create a line w/o a any nodes."
        }
        
        // Number of nodes should be no more than pow(2, level)
        // Recipe: padding + node + padding (odd)
        // Recipe: padding + node + padding + node + padding (even)
        
        // Padding for this level and height:
        let padding = paddingSpaces(for: level, totalHeight: totalHeight)
        
        // Expensive-ish
        // 0(n) for map
        // 0(n-1) for joining ?
        let result = nodes
            .map { String(describing: $0!) }
            .joined(separator: padding)
        
        return padding + result + padding
    }
    
    static public func paddingSpaces(for level: Int, totalHeight: Int) -> String {
        guard level <= totalHeight else {
            return "Can't do that."
        }
        
        // You must treat level as a 0-based index
        // in relation to the total height.
        let exponent = abs(totalHeight - (level - 1))
        
        // pow returns a Decimal which needs to be converted twice
        // to get it back as an integer.
        let length = NSDecimalNumber(decimal: pow(3, exponent)).intValue
        
        return String(repeatElement("-", count: length))
    }

    // From 4.3
    static public func createListOfLevels(root: BSTNode<T>?, levelsList: inout [LinkedList<BSTNode<T>>], level: Int) {
        
        guard let node = root else { return }
        
        var list: LinkedList<BSTNode<T>>? = nil

        if level == levelsList.count {
            // Level is not contained in the list. Create a new one
            list = LinkedList<BSTNode<T>>()
            /* Levels are always traversed in order. So, if this is the first time we've visited level i,
             we must have seen levels 0 through i-1. We can therefore safely add the level at the end.
             */
            levelsList.append(list!)

        } else {
            list = levelsList[level]
        }

        list?.append(key: node)
        createListOfLevels(root: node.left, levelsList: &levelsList, level: level + 1)
        createListOfLevels(root: node.right, levelsList: &levelsList, level: level + 1)
    }

    // From 4.4
    
    // 0(n * log n) complexity.
    static public func isBalanced(root: BSTNode<T>?) -> Bool {
        // For our purposes, a balanced tree is defined to be a tree such that the heights of the two subtrees
        // of any node never differ by more than one.
        
        // Empty Tree casse.
        guard let node = root else { return false }
        
        // Could get faster performance if height function _also_ checked for balance.
        // Have height return an error code when the tree is imbalanced, and the height otherwise.
        let rightHeight = height(root: node.right)
        let leftHeight = height(root: node.left)
        
        // Immediately return false if a height diff
        // is greater than 1.
        if abs(rightHeight - leftHeight) > 1 {
            return false
        }
        
        // Recurse down the tree if the subtrees were found
        // to have the same height.
        return isBalanced(root: node.left) && isBalanced(root: node.right)
    }

    // From 4.5
    
    // A BST is valid if, for every subtree the values in the tree adhere to
    // the following ordering:
    // Left Node <= Current Node < Right Node for ALL subtrees.
    
    static public func isValidBST(root: BSTNode<T>?, lastSeen: inout T?) -> Bool {
    
        guard let node = root else {
            // Returning true, here, is that OK?
            return true
        }
        
        // Recurse left subtree for in-order traversal
        if !isValidBST(root: node.left, lastSeen: &lastSeen) {
            return false
        }
        
        // Compare lastSeen w/ current node.
        // If current node <= the node we last saw,
        // which should always be the node to our logical "left",
        // Then we dont' have a valid BST. If I'm the current node
        // all nodes to my left should have values less than me.
        if let last = lastSeen, node.key <= last {
            return false
        }
        
        // Visit the current node.
        lastSeen = node.key
        
        // Recurse the right subtree maintaining in-order traversal
        if !isValidBST(root: node.right, lastSeen: &lastSeen) {
            return false
        }
        
        // Never returned false, so we're valid!
        return true
    }

    static public func isValidBSTMinMax(root: BSTNode<T>?) -> Bool {
        return isValidBSTMinMax(root: root, min: nil, max: nil)
    }
    
    // Recurses left and right passing down a min value to the left and a max value to the right.
    static private func isValidBSTMinMax(root: BSTNode<T>?, min: T?, max: T?) -> Bool {
        guard let node = root else { return true }
        
        // If the current node is less than the min, this can't be a BST.
        // If the current node is greater than the max, this can't be a BST.
        if (min != nil && node.key <= min!) || (max != nil && node.key > max!) {
            return false
        }
        
        // Recurse left with a new max set to the current node's key.
        // Recurse right with a new min set to the current node's key.
        // Fail if either call fails.
        if !isValidBSTMinMax(root: node.left, min: min, max: node.key) || !isValidBSTMinMax(root: node.right, min: node.key, max: max) {
            return false
        }
        
        return true
    }
    
    /*
     Commented out because the Swift compiler can't handle everything in this function.
     
    // Lifted (and adapted) directly from: https://stackoverflow.com/questions/43898440/how-to-draw-a-binary-tree-in-console
    static public func treeString<T>(_ node:BSTNode<T>, using nodeInfo:(BSTNode<T>)->(String, BSTNode<T>?, BSTNode<T>?)) -> String
    {
        // node value string and sub nodes
        let (stringValue, leftNode, rightNode) = nodeInfo(node)
        
        let stringValueWidth  = stringValue.count
        
        // recurse to sub nodes to obtain line blocks on left and right
        let leftTextBlock = leftNode == nil ? [] : treeString(leftNode!, using:nodeInfo).components(separatedBy:"\n")
        let rightTextBlock = rightNode == nil ? [] : treeString(rightNode!, using:nodeInfo).components(separatedBy:"\n")
        
        // count common and maximum number of sub node lines
        let commonLines = min(leftTextBlock.count, rightTextBlock.count)
        let subLevelLines = max(rightTextBlock.count, leftTextBlock.count)
        
        // extend lines on shallower side to get same number of lines on both sides
        let leftSubLines = leftTextBlock + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
        let rightSubLines = rightTextBlock + Array(repeating:"", count: subLevelLines-rightTextBlock.count)
        
        // compute location of value or link bar for all left and right sub nodes
        //   * left node's value ends at line's width
        //   * right node's value starts after initial spaces
        let leftLineWidths = leftSubLines.map{ $0.count}
        let rightLineIndents = rightSubLines.map{ $0.prefix { $0==" " }.count  }
        
        // top line value locations, will be used to determine position of current node & link bars
        let firstLeftWidth = leftLineWidths.first ?? 0
        let firstRightIndent = rightLineIndents.first ?? 0
        
        // width of sub node link under node value (i.e. with slashes if any)
        // aims to center link bars under the value if value is wide enough
        //
        // ValueLine:    v     vv    vvvvvv   vvvvv
        // LinkLine:    / \   /  \    /  \     / \
        //
        let linkSpacing       = min(stringValueWidth, 2 - stringValueWidth % 2)
        let leftLinkBar       = leftNode  == nil ? 0 : 1
        let rightLinkBar      = rightNode == nil ? 0 : 1
        let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
        let valueOffset       = (stringValueWidth - linkSpacing) / 2
        
        // find optimal position for right side top node
        //   * must allow room for link bars above and between left and right top nodes
        //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
        //   * can be offset to the left if lower subNodes of right node
        //     have no overlap with subNodes of left node
        let minSpacing = 2
        let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
            .reduce(firstLeftWidth + minLinkWidth)
            { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }
        
        // extend basic link bars (slashes) with underlines to reach left and right
        // top nodes.
        //
        //        vvvvv
        //       __/ \__
        //      L       R
        //
        let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
        let rightLinkExtra    = linkExtraWidth / 2
        let leftLinkExtra     = linkExtraWidth - rightLinkExtra
        
        // build value line taking into account left indent and link bar extension (on left side)
        let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
        let valueLine         = String(repeating:" ", count:max(0,valueIndent))
            + stringValue
        
        // build left side of link line
        let leftLink          = leftNode == nil ? ""
            : String(repeating: " ", count:firstLeftWidth)
            + String(repeating: "_", count:leftLinkExtra)
            + "/"
        
        // build right side of link line (includes blank spaces under top node value)
        let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
        let rightLink         = rightNode == nil ? ""
            : String(repeating:  " ", count:rightLinkOffset)
            + "\\"
            + String(repeating:  "_", count:rightLinkExtra)
        
        // full link line (will be empty if there are no sub nodes)
        let linkLine          = leftLink + rightLink
        
        // will need to offset left side lines if right side sub nodes extend beyond left margin
        // can happen if left subtree is shorter (in height) than right side subtree
        let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
        let leftIndent        = String(repeating:" ", count:leftIndentWidth)
        let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }
        
        // compute distance between left and right sublines based on their value position
        // can be negative if leading spaces need to be removed from right side
        let mergeOffsets = indentedLeftLines
            .map{ $0.count }
            .map{ leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
            .enumerated()
            .map{ rightSubLines[$0].isEmpty ? 0  : $1 }
        
        // combine left and right lines using computed offsets
        //   * indented left sub lines
        //   * spaces between left and right lines
        //   * right sub line with extra leading blanks removed.
        let mergedSubLines = zip(mergeOffsets.enumerated(), indentedLeftLines)
            .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
            .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }
        
        // Assemble final result combining
        //  * node value string
        //  * link line (if any)
        //  * merged lines from left and right sub trees (if any)
        let result = [leftIndent + valueLine]
            + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
            + mergedSubLines
        
        return result.joined(separator:"\n")
    }*/
}



