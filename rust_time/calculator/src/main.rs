// This is a simple program. Something I can quickly create, scale if I want to.
// A proof of discipline. Not to be failed. Don't hire me if this doesn't do what it's supposed to.
// I'm completing this project as a part of a code sprint. I'm actually not allowed to do anything else
// until it's done.
/**
 * Startup behavior:
 * * display welcome message
 * * explain basic usage
 * 
 * Overall usage:
 * user enters one number, a space, a symbol, and another number, presses enter
 * reads, parses user input. Uses rust built-in math to return a response
 */
use text_io::try_scan;
use text_io::read;
use text_io::scan;


fn main() {
    display_greeting();
    let input = get_input();
    println!("{:?}", input);
    

    
    let my_op = create_operation(input.0, input.1, input.2);
    match my_op {
        Ok(op) => match get_result_from_operation(op) {
                      Ok(res) => println!("{}", res),
                      Err(err_msg) => println!("{}", err_msg)
                  },
        Err(err_msg) => println!("{}", err_msg)
    }
}

// Display a greeting message
fn display_greeting() {
    println!("Hi it's me I'm a calculator please help :(");
}

// Get a line of input from the user
// Returns input as a string
// TODO: is it a String or a str or what?
// Input must be: 
// `usize char usize`
// TODO: add commands for user interaction like exit and help
// TODO: add support for floats
// TODO: use try_scan instead (docs are completely incomprehensible to me)
// Note that the order of first, second, and symbol varies
// currently panics if the user tries to enter a float or negative
fn get_input() -> (usize, usize, char) {
    let first: usize;
    let second: usize;
    let symbol: char;
    
    scan!("{} {} {}", first, symbol, second);

    return (first, second, symbol);
}

// A mathematical operation on two numbers
// first: first number given
// second: second number given
// symbol: symbol / specific operation. e.g. +, -, /, etc.
#[derive(Debug)]
struct Operation {
    first: usize,
    second: usize,
    symbol: char
}

// Accepted characters to represent operations
// There MUST be code to handle each operation in both create_operation and
// get_result_from_operation or they will not work.
// TODO: ideally this would be some tuple type like (char, fn) where fn
//   points to a handler function. OR I guess the Operation struct could
//   have a handler... for now we're doing it this way to get it done.
//   OR OR it could be an enum. Goober.
const OPERATIONS: [char; 4] = ['+', '-', '/', '*'];

// Returns true if an operation symbol is valid, false otherwise
// In current version of code there's not much reason to have this as it's own function.
fn validate_operation_symbol(sym: char) -> bool {
    if OPERATIONS.contains(&sym) {
        return true;
    } else {
        return false;
    }
}

// Creates a new operation. Needed to allow validation
// TODO: see if there's a way to more idiomatically check struct.new params
// first: Operation.first, the first number given
// second: Operation.second, the second number given
// symbol: Operation.symbol, the symbol for the mathematical operation (+, -, /, etc)
fn create_operation(first: usize, second: usize, symbol: char) -> Result<Operation, String> {
    if ! validate_operation_symbol(symbol) {
        return Err(String::from(format!("Invalid symbol: {s}", s = symbol)));
    } else {
        return Ok(Operation {first: first, second: second, symbol: symbol});
    }
}

// Returns the mathematical result of a given operation
// op: the operation to resolve
// Assumes operation symbol is valid, that's checked on operation creation
// TODO: catch divide by zero errors
fn get_result_from_operation(op: Operation) -> Result<usize, String> {
    return match op.symbol {
        '+' => Ok(op.first + op.second),
        '-' => Ok(op.first - op.second),
        '/' => match op.second {0 => Err(String::from("Can't divide by zero bud. ")), _ => Ok(op.first / op.second)},
        '*' => Ok(op.first * op.second),
        _ => Err(String::from("Invalid operator, unable to get result. "))
    };
}

// TODO: figure out what the deal is with all of those ugly-named files and how to add em to gitignore