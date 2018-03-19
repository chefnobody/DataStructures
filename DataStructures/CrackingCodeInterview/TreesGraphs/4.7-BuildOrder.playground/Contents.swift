//: Playground - noun: a place where people can play

import UIKit

/*
 Build Order:
 You are given a list of projects and a list of dependencies (which is a list of pairs of projects, where the second project is dependent upon the first project). All of a project's dependencies must be built before the project is. Find a build order that will allow the projecs to be built If there is no valid build order, return an error.
 Ex:
 INPUT
    projects: a, b, c, d, e, f
    deps: (a, d), (f, b), (b, d), (f, a), (d, c)
 OUTPUT:
    f, e, a, b, d, c

 */
