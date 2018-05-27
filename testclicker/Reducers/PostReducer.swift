//
//  PostReducer.swift
//  testclicker
//
//  Created by Ariel Kuhn on 20/5/18.
//  Copyright © 2018 arielkuhn. All rights reserved.
//

import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
func postReducer(action: Action, state: [Post]?) -> [Post] {
    // if no state has been provided, create the default state
    var state = state ?? []
    

    switch action {
    case let action as PostGetAction:
        state = action.posts

    default:
        break
    }
    
    return state
}
