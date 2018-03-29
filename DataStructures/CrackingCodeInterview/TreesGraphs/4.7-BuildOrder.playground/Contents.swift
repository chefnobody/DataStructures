//: Playground - noun: a place where people can play

import UIKit

/*
 Build Order:
 You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependent upon the first project).
 All of a project's dependencies must be built before the project is. Find a build order that will allow the projecs to be built If there is no valid build order, return an error.
 Ex:
 INPUT
    projects: a, b, c, d, e, f
    deps: (a, d), (f, b), (b, d), (f, a), (d, c)
 OUTPUT:
    f, e, a, b, d, c

 So by hand lets build a tree for each project.
 
 - take current order of projects:
 
 a   b   c   d   e   f
 
 First, ensure we build a before d (d depends on a)
 - current order of projects doesn't change:
 
 a   b   c   d   e   f
 
 Next, build f before b (b depends on f)
 - move f infront of b:
 
 a   f   b   c   d   e
 
 Next, build b before d (d depends on b):
 - current order is fine. b will be built before d.
 
 a   f   b   c   d   e
 
 Next, build f, before a because a depends on f
 - move f, before a.
 
 f   a   b   c   d   e
 
 Finally, build d before c:
 - move d before c
 
 f   a   b   d   c   e

 (note, e doesn't have any deps, so it doesn't matter where it goes)
 Answer from book is also valid: f, e, a, b, d, c
 
 Approaches:
 - I've heard this called a dependency tree or dependency graph, so using one of those structures could help.
 - Taken the list of projects, ensure that for a given dependency (proj a, proj b) that project a comes before proj b
   in the list of projects. iterate through all the dependencies and all the projects.
 
 Issues:
 - How do you determine if there is no build order that satisfies?
   - What if there's a dependency "x" that isn't listed in the set of projects?
     Is that enough to warrant an impossible build order? I would think so because we don't know what "x" might depend on.
 - What do you do about dupe projects? Should you cull them from the list?
 - Can't assume the projects array has any helpful sorted order for finding dependencies.
 - With the iterative array-basd approach you get super inefficient because you're traversing the projects array at most 0(n) times
   for each dependency.
 
 
 */

var projects = ["a", "b", "c", "d", "e", "f"]
var dependencies = [("a", "d"), ("f", "b"), ("b", "d"), ("f", "a"), ("d", "c")]

func findBuildOrder(projects: inout [String], dependencies: [(String, String)]) -> String {
    
    for (i, j) in dependencies {
        
        guard let depIndex = projects.index(of: i) else {
            return "Impossible build order. No project for dependency: \(i) exists."
        }
        
        guard let projIndex = projects.index(of: j) else {
            return "Impossible build order. No project \(j) exists."
        }
        
        // Check if the dependency will be built
        // after the project. If so, move the dep
        // to the position right before the project.
        
        // Neither will be nil at this point.
        if depIndex > projIndex {
            // move item at depIndex to projIndex - 1
            projects.insert(projects.remove(at: depIndex), at: (projIndex - 1))
        }
    }
    
    return projects.joined(separator: " -> ")
}

// f, a, b, d, c, e
findBuildOrder(projects: &projects, dependencies: dependencies)

// invalid build order because dep x, isn't an available project.
projects = ["a", "b", "c", "d", "e", "f"]
dependencies = [("a", "d"), ("f", "b"), ("x", "f"), ("b", "d"), ("f", "a"), ("d", "c")]
findBuildOrder(projects: &projects, dependencies: dependencies)
