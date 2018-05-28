//
//  AppState.swift
//  testclicker
//
//  Created by Ariel Kuhn on 19/5/18.
//  Copyright © 2018 arielkuhn. All rights reserved.
//


import ReSwift


//let data: [Post] = [
//Post(id:1,name:"two"    )
//]


func definedata()->[Post]{
    var dataArray = [Post]()
    
    dataArray.append(Post(id:0,name:"one"))
    dataArray.append(Post(id:1,name:"two"))
    return dataArray
}



struct AppState: StateType {
    var counter: Int = 6
    var posts: [Post] = definedata()
}
