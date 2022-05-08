# DISwift

DISwift is a lightweight library which allows you not to be crazy with dependency containers in your apps, but stay flexible.



## How to use

```swift

let container = DIContainer()

container.register(
    .weak {
        AuthUseCase(authService: *$0, userStore: *$0)
    }.as(
        IAuthUseCase.self
    )
)

container.register(
    .single(TokenStorage()).as(ITokenStorage.self)
)

let tokenStorage = container.resolve(ITokenStorage.self)
// or
let authUseCase: IAuthUseCase = *container


```


## Requirements

ReactSwift supports **iOS 11 and up**, and can be compiled with **Swift 4.2 and up**.



## Installation

### Swift Package Manager

The ReactSwift package URL is:

```
`https://github.com/alobanov11/DISwift`
```



## License

DISwift is licensed under the [Apache-2.0 Open Source license](http://choosealicense.com/licenses/apache-2.0/).

You are free to do with it as you please.  We _do_ welcome attribution, and would love to hear from you if you are using it in a project!
