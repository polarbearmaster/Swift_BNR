//: Playground - noun: a place where people can play

import Cocoa

enum Token {
    case Number(Int)
    case Op(Character)
}

class Lexer {
    
    enum Error: ErrorType {
        case InvalidCharacter(String.CharacterView.Index, Character)
    }
    
    let input: String.CharacterView
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "Cannot advance past the end!")
        ++position
    }
    
    func getNumber() -> Int {
        var value = 0
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Another digit - add it into value
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default:
                // A non-digit - go back to regular lexing
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9":
                // Start of a number - need to grab the rest
                let value = getNumber()
                tokens.append(.Number(value))
            case "+":
                tokens.append(.Op("+"))
                advance()
            case "-":
                tokens.append(.Op("-"))
                advance()
            case "*":
                tokens.append(.Op("*"))
                advance()
            case "/":
                tokens.append(.Op("/"))
                advance()
            case " ":
                // Just advance to ignore spaces
                advance()
            default:
                // Something unexpected - need to send back in error
                throw Error.InvalidCharacter(position, nextCharacter)
            }
        }
        
        return tokens
    }
    
}

class Parser {
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Int, Token)
        case CannotDivideToZero(Token)
    }
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        return tokens[position++]
    }
    
    func getNumber() throws -> Int {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value):
            return value
        default:
            throw Error.InvalidToken(position, token)
        }
    }
    
    func term() throws -> Int {
        var value = try getNumber()
        while let token = getNextToken() {
            switch token {
            case .Op("*"):
                let nextValue = try getNumber()
                value *= nextValue
            case .Op("/"):
                let nextValue = try getNumber()
                guard nextValue > 0 else {
                    throw Error.CannotDivideToZero(token)
                }
                value /= nextValue
            default:
                position -= 1
                return value
            }
        }
        return value
    }
    
    func parse() throws -> Int {
        var value = try term()
        
        while let token = getNextToken() {
            switch token {
            case .Op("+"):
                let nextValue = try term()
                value += nextValue
            case .Op("-"):
                let nextValue = try term()
                value -= nextValue
            default:
                throw Error.InvalidToken(position, token)
            }
        }
        
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        let result = try parser.parse()
        print("Parser output: \(result)")
    } catch Lexer.Error.InvalidCharacter(let a, let char) {
        print("Input contained an invalid character at index \(a): \(char)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let a, let token) {
        print("Invalid token during parsing at index \(a): \(token)")
    } catch Parser.Error.CannotDivideToZero(let token) {
        print("Cannot divide to 0 \(token)")
    }
    catch {
        print("An error occurred: \(error)")
    }
}

evaluate("1 + 3 + 7a + 8")
evaluate("10 + 3 3 + 7")
evaluate("10 * 3 + 5 * 3")
evaluate("10 + 3 * 5 + 3")
evaluate("10 + 3 * 5 * 3")

