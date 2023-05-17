# AhmertNetworkManager

## Installation 
To install this package, import 'https://github.com/ahmetmert1/AhmertNetworkManager.git' package by Swift Package Manager.

## Description 
AhmertNetworkManager can performs GET and POST operations easily !

"AhmertNetworkManager" utilizes <b>URLSession</b>, which is a native library provided by Apple.

## Usage 

```swift
import AhmertNetworkManager

NetworkManager.shared.request(type: yourModel.self, urlString: "example.com", method: .get) { response, error in

   //Your code here   
}
```


