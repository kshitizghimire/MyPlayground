import Foundation

var str = "Hello, playground"

//: [Next](@next)

class Trie {
    class TrieNode {
        var isWord = false
        var children = [Character: TrieNode]()

        func insert(character: Character) {
            if children[character] == nil {
                children[character] = TrieNode()
            }
        }

        func node(for character: Character) -> TrieNode? {
            return children[character]
        }
    }

    let root = TrieNode()
}
