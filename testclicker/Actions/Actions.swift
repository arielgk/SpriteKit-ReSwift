import ReSwift

// all of the actions that can be applied to the state
struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}
struct PostGetAction: Action {
    let posts: [Post]

}
