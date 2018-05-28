import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives



func counterReducer(action: Action, counter: Int?) -> Int {
    var counter = counter ?? AppState().counter
    
    switch action {
    case _ as CounterActionIncrease:
        counter += 1
    case _ as CounterActionDecrease:
        counter -= 1
    default:
        break
    }
    
    return counter
}
