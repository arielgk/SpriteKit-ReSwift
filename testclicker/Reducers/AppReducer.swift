//
//  AppReducer.swift
//  testclicker
//
//  Created by Ariel Kuhn on 27/5/18.
//  Copyright © 2018 arielkuhn. All rights reserved.
//

import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {

        return AppState(
            counter: counterReducer(action: action, counter: state?.counter),
            posts: postReducer(action:action, state: state?.posts)
        )
    
}
