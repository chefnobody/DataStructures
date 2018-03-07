//: Playground - noun: a place where people can play

import UIKit

/*
 Rotate Matrix
 Given an image represented by an N x N matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees.
 
 - dot products?
 - swap each edge starting from the outside and working inward?
   - think of each edge as a "layer" that is being shifted/mapped to the right.
   - top -> left, left -> top, bottom -> left, right -> bottom
 - swap index by index.
 for i = 0 to N
    temp = top[i]
    top[i] = left[i]
    left[i] = bottom[i]
    bottom[i] = right[i]
    right[i] = temp
 
 */

func rotate(matrix: inout [[Int]]) -> Bool {
    
    // Guard the weird cases.
    if matrix.count == 0 || matrix.count != matrix[0].count { return false }
    
    let n = matrix.count
    
    // iterate through half the length.
    for layer in 0..<(n/2) {
        var first = layer               // first position in the layer
        var last = n - 1 - layer        // last postion in the layer.
        
        for i in 0..<last {
            var offset = i - first
            var top = matrix[first][i]  // save top
            
            // left -> top
            matrix[first][i] = matrix[last - offset][first]
            
            // bottom -> left
            matrix[last - offset][first] = matrix[last][last - offset]
            
            // right -> bottom
            matrix[last][last - offset] = matrix[i][last]
            
            // top -> right
            matrix[i][last] = top   // right <- saved top
        }
    }
    
    return true
}

var m = [
    [0, 4, 5, 6],
    [1, 9, 10, 11],
    [9, 15, 2, 8],
    [1, 2, 1, 0],
]

rotate(matrix: &m)

/*
 result should be:
    var m = [
        [1, 9, 1, 0],
        [2, 15, 9, 4],
        [1, 2, 10, 5],
        [0, 8, 11, 6],
 ]
 */

print(m)
 


